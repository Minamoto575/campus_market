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
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学生中心控制器
 * @author Administrator
 *
 */
@RequestMapping("/home/student")
@Controller
public class HomeStudentController {

	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private WantedGoodsService wantedGoodsService;
	@Autowired
	private ReportGoodsService reportGoodsService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private StudentGoodsService studentGoodsService;
	@Autowired
	private OrderFormService orderFormService;
	@Autowired
	private ConsumptionService consumptionService;
	@Autowired
	private RechargeService rechargeService;

	private final static String CONSUMPTION = "consumption";
	private final static String RECHARGE = "recharge";

	/**
	 * 学生登录主页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		model.addAttribute("studentGoodsList",studentGoodsService.findByStudentId(loginedStudent.getId()));
		model.addAttribute("wantedGoodsList", wantedGoodsService.findByStudent(loginedStudent));
		model.addAttribute("reportGoodsList", reportGoodsService.findByStudent(loginedStudent));
		model.addAttribute("orderFormList",orderFormService.findByStudent(loginedStudent));
		return "home/student/index";
	}

	/**
	 * 订单页面
	 * @param model
	 * @param pageBean
	 * @param orderForm
	 * @return
	 */
	@RequestMapping("/order")
	public String order(Model model, PageBean<OrderForm> pageBean,OrderForm orderForm){
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		orderForm.setStudent(loginedStudent);
		model.addAttribute("pageBean", orderFormService.findList(pageBean,orderForm));
		return "home/student/order";
	}

	/**
	 * 修改个人信息提交表单
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/edit_info",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> editInfo(Student student){
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		loginedStudent.setAcademy(student.getAcademy());
		loginedStudent.setGrade(student.getGrade());
		loginedStudent.setMobile(student.getMobile());
		loginedStudent.setNickname(student.getNickname());
		loginedStudent.setQq(student.getQq());
		loginedStudent.setSchool(student.getSchool());
		if(studentService.save(loginedStudent) == null){
			return Result.error(CodeMsg.HOME_STUDENT_EDITINFO_ERROR);
		}
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY,loginedStudent);
		return Result.success(true);
	}
	
	/**
	 * 保存用户头像
	 * @param headPic
	 * @return
	 */
	@RequestMapping(value="/update_head_pic",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updateHeadPic(@RequestParam(name="headPic",required=true)String headPic){
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		loginedStudent.setHeadPic(headPic);;
		if(studentService.save(loginedStudent) == null){
			return Result.error(CodeMsg.HOME_STUDENT_EDITINFO_ERROR);
		}
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY,loginedStudent);
		return Result.success(true);
	}
	
	/**
	 * 图书发布页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/publish",method=RequestMethod.GET)
	public String publish(Model model){
		return "home/student/publish";
	}
	
	/**
	 * 图书发布表单提交
	 * @param studentGoods
	 * @return
	 */
	@RequestMapping(value="/publish",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> publish(StudentGoods studentGoods){

		CodeMsg validate = ValidateEntityUtil.validate(studentGoods);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(studentGoods.getGoodsCategory() == null || studentGoods.getGoodsCategory().getId() == null
				|| studentGoods.getGoodsCategory().getId().longValue() == -1){
			return Result.error(CodeMsg.HOME_STUDENT_PUBLISH_CATEGORY_EMPTY);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(loginedStudent == null){
			return Result.error(CodeMsg.HOME_STUDENT_NOT_LOGIN);
		}
		Student byId = studentService.findById(loginedStudent.getId());
		studentGoods.setStudent(byId);
		if(studentGoodsService.save(studentGoods) == null){
			return Result.error(CodeMsg.HOME_STUDENT_PUBLISH_ERROR);
		}

		return Result.success(true);
	}

	/**
	 * @description 查询学生的消费充值记录
	 * @param  model
	 * @param  conPageBean
	 * @param rePageBean
	 * @author kuang
	 * @date 2022/2/24
	 */
	@GetMapping("/money")
	public String money(Model model, PageBean<Consumption> conPageBean,PageBean<Recharge> rePageBean,
						@RequestParam(value="type") String type) {
		Student student  = (Student) SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(student==null){
			return "home/index/login";
		}
		if(type.equals(CONSUMPTION)){
			model.addAttribute("pageBean",consumptionService.listByStudent(conPageBean,student));
			model.addAttribute("type",CONSUMPTION);
		}else if(type.equals(RECHARGE)){
			model.addAttribute("pageBean",rechargeService.listByStudent(rePageBean,student));
			model.addAttribute("type",RECHARGE);
		}
		return "home/student/money";
	}

	/**
	 * 发布求购图书页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/publish_wanted",method=RequestMethod.GET)
	public String publishWanted(Model model){
		return "home/student/publish_wanted";
	}
	
	/**
	 * 求购图书发布提交
	 * @param wantedGoods
	 * @return
	 */
	@RequestMapping(value="/publish_wanted",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> publishWanted(WantedGoods wantedGoods){
		CodeMsg validate = ValidateEntityUtil.validate(wantedGoods);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		wantedGoods.setStudent(loginedStudent);
		if(wantedGoodsService.save(wantedGoods) == null){
			return Result.error(CodeMsg.HOME_STUDENT_PUBLISH_ERROR);
		}
		return Result.success(true);
	}
	
	/**
	 * 编辑求购图书页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit_wanted_goods",method=RequestMethod.GET)
	public String editWantedGoods(@RequestParam(name="id",required=true)Long id,Model model){
		WantedGoods wantedGoods = wantedGoodsService.find(id);
		if(wantedGoods == null){
			model.addAttribute("msg", "求购图书不存在！");
			return "error/runtime_error";
		}
		model.addAttribute("wantedGoods", wantedGoods);
		return "home/student/edit_wanted";
	}
	
	/**
	 * 编辑求购信息表单提交
	 * @param wantedGoods
	 * @return
	 */
	@RequestMapping(value="/edit_wanted_goods",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> editWantedGoods(WantedGoods wantedGoods){
		CodeMsg validate = ValidateEntityUtil.validate(wantedGoods);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(wantedGoods.getId() == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		WantedGoods existWantedGoods = wantedGoodsService.find(wantedGoods.getId());
		if(existWantedGoods == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(existWantedGoods.getStudent().getId().longValue() != loginedStudent.getId().longValue()){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		existWantedGoods.setContent(wantedGoods.getContent());
		existWantedGoods.setName(wantedGoods.getName());
		existWantedGoods.setSellPrice(wantedGoods.getSellPrice());
		existWantedGoods.setTradePlace(wantedGoods.getTradePlace());
		if(wantedGoodsService.save(existWantedGoods) == null){
			return Result.error(CodeMsg.HOME_STUDENT_PUBLISH_ERROR);
		}
		
		return Result.success(true);
	}
	
	/**
	 * 删除求购图书
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete_wanted",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteWanted(@RequestParam(name="id",required=true)Long id){
		WantedGoods wantedGoods = wantedGoodsService.find(id);
		if(wantedGoods == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(wantedGoods.getStudent().getId().longValue() != loginedStudent.getId().longValue()){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		wantedGoodsService.delete(id);
		return Result.success(true);
	}
	
	/**
	 * 建议图书
	 * @param reportGoods
	 * @return
	 */
	@RequestMapping(value="/report_goods",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> reportGoods(ReportGoods reportGoods){
		CodeMsg validate = ValidateEntityUtil.validate(reportGoods);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(reportGoods.getGoods() == null || reportGoods.getGoods().getId() == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		ReportGoods find = reportGoodsService.find(reportGoods.getGoods().getId(), loginedStudent.getId());
		if(find != null){
			return Result.error(CodeMsg.HOME_STUDENT_REPORTED_GOODS);
		}
		reportGoods.setStudent(loginedStudent);
		if(reportGoodsService.save(reportGoods) == null){
			return Result.error(CodeMsg.HOME_STUDENT_REPORT_GOODS_ERROR);
		}
		return Result.success(true);
	}
	
	/**
	 * 删除建议信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete_report",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteReport(@RequestParam(name="id",required=true)Long id){
		ReportGoods reportGoods = reportGoodsService.find(id);
		if(reportGoods == null){
			return Result.error(CodeMsg.HOME_STUDENT_REPORTED_NO_EXIST);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(reportGoods.getStudent().getId().longValue() != loginedStudent.getId().longValue()){
			return Result.error(CodeMsg.HOME_STUDENT_REPORTED_NO_EXIST);
		}
		reportGoodsService.delete(id);
		return Result.success(true);
	}
	
	/**
	 * 获取个人图书统计信息
	 * @return
	 */
	@RequestMapping(value="/get_stats",method=RequestMethod.POST)
	@ResponseBody
	public Result<Map<String, Integer>> getStats(){
		Map<String, Integer> ret = new HashMap<String, Integer>();
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		List<StudentGoods> findByStudentId = studentGoodsService.findByStudentId(loginedStudent.getId());
		Integer goodsTotal = findByStudentId.size();
		Integer notAcquired = 0;//未被收购
		Integer hasAcquired = 0;//已被收购
		for (StudentGoods studentGoods : findByStudentId) {
			if(studentGoods.getStatus() == StudentGoods.NOT_BE_ACQUIRED){
				notAcquired++;
			}
			if(studentGoods.getStatus() == StudentGoods.HAS_BEEN_TO_BUY){
				hasAcquired++;
			}
		}
		ret.put("goodsTotal", goodsTotal);
		ret.put("notAcquired", notAcquired);
		ret.put("hasAcquired", hasAcquired);
		return Result.success(ret);
	}
	
	/**
	 * 评论图书
	 * @param comment
	 * @return
	 */
	@RequestMapping(value="/comment",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> comment(Comment comment){
		CodeMsg validate = ValidateEntityUtil.validate(comment);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(comment.getGoods() == null || comment.getGoods().getId() == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		Goods find = goodsService.findById(comment.getGoods().getId());
		if(find == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		comment.setStudent(loginedStudent);
		if(commentService.save(comment) == null){
			return Result.error(CodeMsg.HOME_STUDENT_COMMENT_ADD_ERROR);
		}
		return Result.success(true);
	}
	
	/**
	 * 修改学生用户密码
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	@RequestMapping(value="/edit_pwd",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> editPwd(@RequestParam(name="oldPwd",required=true)String oldPwd,
			@RequestParam(name="newPwd",required=true)String newPwd){
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(!loginedStudent.getPassword().equals(oldPwd)){
			return Result.error(CodeMsg.HOME_STUDENT_EDITPWD_OLD_ERROR);
		}
		loginedStudent.setPassword(newPwd);
		if(studentService.save(loginedStudent) == null){
			return Result.error(CodeMsg.HOME_STUDENT_EDITINFO_ERROR);
		}
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY, loginedStudent);
		return Result.success(true);
	}

	/**
	 * 删除图书
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete_goods",method = RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteGoods(@RequestParam(name="id",required=true)Long id){
		StudentGoods studentGoods = studentGoodsService.find(id);
		if(studentGoods == null){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		if(studentGoods.getStatus() == StudentGoods.HAS_BEEN_TO_BUY){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_DELETE_STATUS_ERROR);
		}
		Student loginedStudent = (Student)SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
		if(studentGoods.getStudent().getId().longValue() != loginedStudent.getId().longValue()){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
		}
		try{
			studentGoodsService.delete(id);
		}catch (Exception e){
			return Result.error(CodeMsg.HOME_STUDENT_GOODS_DELETE_ERROR);
		}
		return Result.success(true);
	}



}
