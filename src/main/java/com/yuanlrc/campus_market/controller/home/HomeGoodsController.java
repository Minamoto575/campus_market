package com.yuanlrc.campus_market.controller.home;

import com.yuanlrc.campus_market.bean.CodeMsg;
import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.bean.Result;
import com.yuanlrc.campus_market.constant.SessionConstant;
import com.yuanlrc.campus_market.entity.common.*;
import com.yuanlrc.campus_market.service.common.*;
import com.yuanlrc.campus_market.util.SessionUtil;
import com.yuanlrc.campus_market.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * 前台图书管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/home/goods")
@Controller
public class HomeGoodsController {

	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private OrderFormService orderFormService;
	@Autowired
	private RechargeService rechargeService;
	@Autowired
	private ConsumptionService consumptionService;

	/**
	 * 图书详情页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/detail")
	public String detail(@RequestParam(name="id",required=true)Long id,Model model){
		Goods goods = goodsService.findById(id);
		if(goods == null){
			model.addAttribute("msg", "图书不存在！");
			return "error/runtime_error";
		}
		model.addAttribute("goods", goods);
		model.addAttribute("commentList", commentService.findByGoods(goods));
		//更新图书浏览量
		goods.setViewNumber(goods.getViewNumber() + 1);
		goodsService.save(goods);
		return "home/goods/detail";
	}

	@RequestMapping(value="/show")
	public String show(@RequestParam(name="id",required=true)Long id,Model model){
		Goods goods = goodsService.findById(id);
		if(goods == null){
			model.addAttribute("msg", "图书不存在！");
			return "error/runtime_error";
		}
		model.addAttribute("goods", goods);
		model.addAttribute("commentList", commentService.findByGoods(goods));
		goodsService.save(goods);
		return "home/goods/show";
	}

	/**
	 * 根据图书分类搜索图书信息
	 * @param cid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(@RequestParam(name="cid",required=true)Long cid,PageBean<Goods> pageBean,Model model){
		pageBean.setPageSize(12);
		GoodsCategory goodsCategory = goodsCategoryService.findById(cid);
		if(goodsCategory == null){
			model.addAttribute("msg", "图书分类不存在！");
			return "error/runtime_error";
		}
		//接下来分两步来考虑，分类是否是二级分类。
		List<Long> ids = new ArrayList<Long>();
		ids.add(goodsCategory.getId());
		if(goodsCategory.getParent() == null){
			//选中的是顶级分类，此时需要获取该顶级分类下的所有子分类
			List<GoodsCategory> findChildren = goodsCategoryService.findChildren(goodsCategory);
			for(GoodsCategory gc : findChildren){
				ids.add(gc.getId());
			}
		}
		model.addAttribute("pageBean", goodsService.findlist(ids, pageBean));
		model.addAttribute("gc",goodsCategory);
		return "home/goods/list";
	}
	
	/**
	 * 获取已出售的图书总数
	 * @return
	 */
	@RequestMapping(value="/get_sold_total",method=RequestMethod.POST)
	@ResponseBody
	public Result<Long> getSoldTotal(){
		return Result.success(goodsService.getSoldTotalCount());
	}

	/**
	 * 购买填写地址页面
	 * @return
	 */
	@RequestMapping("/to_buy")
	public String toBuy(Model model,@RequestParam(name="goodsId",required=true)Long goodsId){
		Student student = (Student) SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(student == null){
			return "redirect:home/index/login";
		}
		Goods goods = goodsService.findById(goodsId);
		if(goods == null){
			return "redirect:home/index/index";
		}
		model.addAttribute("student",student);
		model.addAttribute("goods",goods);
		return "home/goods/to_buy";
	}

	/**
	 * 购买提交
	 * @param goodsId
	 * @param discountType
	 * @param orderForm
	 * @return
	 */
	@RequestMapping(value = "to_buy",method = RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> toBuy(@RequestParam(name="goodsId",required=true)Long goodsId,
								 @RequestParam(name="discountType",required=true)Integer discountType, OrderForm orderForm){

		Student loginedStudent = (Student) SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(loginedStudent == null){
			return Result.error(CodeMsg.HOME_STUDENT_NOT_LOGIN);
		}
		CodeMsg validate = ValidateEntityUtil.validate(orderForm);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		Student student = studentService.findById(loginedStudent.getId());
		Goods goods = goodsService.findById(goodsId);

		if(goods == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}

		if(goods.getStatus() != Goods.GOODS_STATUS_UP){
			return Result.error(CodeMsg.ADMIN_GOODS_STATUS_ERROR);
		}

		if(discountType == 1 && student.getDiscountCoupon() == Student.NOT_COUPON){
			return Result.error(CodeMsg.HOME_DISCOUNT_COUPON_ERROR);
		}
		//余额不足
		if(student.getBalance()<goods.getSellPrice()){
			return Result.error(CodeMsg.HOME_BALANCE_LOW_ERROR);
		}

		orderForm.setSellPrice(goods.getSellPrice());
		if(orderFormService.save(orderForm,student,discountType,goods) == null){
			return Result.error(CodeMsg.HOME_ORDER_FORM_SAVE_ERROR);
		}

		// 扣买家余额
		student.setBalance(student.getBalance()-goods.getSellPrice());
		studentService.save(student);

		// 加卖家余额
		Student seller =  goods.getStudent();
		seller.setBalance(seller.getBalance()+goods.getSellPrice());
		studentService.save(seller);

		// 新增记录交易
		Consumption consumption = new Consumption();
		consumption.setStudent(student);
		consumption.setAmount(goods.getSellPrice());
		consumptionService.save(consumption);

		//更新前端展示的余额
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY, student);

		return Result.success(true);
	}

	/**
	 * @description 查看发布者
	 * @param  sn
	 * @param model
	 * @author kuang
	 * @date 2022/3/1
	 */
	@RequestMapping(value="/publisher")
	public String publisher(@RequestParam(name="sn",required=true)String sn,Model model){
		Student student = studentService.findBySn(sn);
		if(student==null){
			model.addAttribute("msg", "用户不存在！");
			return "error/runtime_error";
		}
		model.addAttribute("student",student);
		return "home/goods/publisher";
	}
}
