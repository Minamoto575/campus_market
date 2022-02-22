package com.yuanlrc.campus_market.controller.admin;

import com.yuanlrc.campus_market.bean.CodeMsg;
import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.bean.Result;
import com.yuanlrc.campus_market.entity.common.Goods;
import com.yuanlrc.campus_market.entity.common.GoodsCategory;
import com.yuanlrc.campus_market.entity.common.Student;
import com.yuanlrc.campus_market.entity.common.StudentGoods;
import com.yuanlrc.campus_market.service.common.GoodsCategoryService;
import com.yuanlrc.campus_market.service.common.GoodsService;
import com.yuanlrc.campus_market.service.common.StudentGoodsService;
import com.yuanlrc.campus_market.service.common.StudentService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 学生图书列表
 */
@Controller
@RequestMapping("/admin/student_goods")
public class StudentGoodsController {

    @Autowired
    private StudentGoodsService studentGoodsService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private GoodsCategoryService goodsCategoryService;
    @Autowired
    private GoodsService goodsService;

    /**
     * 学生售卖图书列表
     * @param studentGoods
     * @param pageBean
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(StudentGoods studentGoods, PageBean<StudentGoods> pageBean, Model model){
        if(studentGoods.getStudent() != null && studentGoods.getStudent().getSn() != null){
            Student student = studentService.findBySn(studentGoods.getStudent().getSn());
            if(student != null){
                studentGoods.setStudent(student);
            }
        }
        if(studentGoods.getGoodsCategory() != null && studentGoods.getGoodsCategory().getName() != null){
            List<GoodsCategory> goodsCategorys = goodsCategoryService.findByName(studentGoods.getGoodsCategory().getName());
            if(goodsCategorys != null && goodsCategorys.size() > 0){
                studentGoods.setGoodsCategory(goodsCategorys.get(0));
            }
        }
        model.addAttribute("title", "收购图书列表");
        model.addAttribute("name", studentGoods.getName());
        model.addAttribute("goodsCategoryName", studentGoods.getGoodsCategory() == null ? null : studentGoods.getGoodsCategory().getName());
        model.addAttribute("sn", studentGoods.getStudent() == null ? null : studentGoods.getStudent().getSn());
        model.addAttribute("pageBean", studentGoodsService.findList(pageBean, studentGoods));

        return "admin/student_goods/list";
    }

    /**
     * 收购
     * @param studentGoodsId
     * @param goods
     * @return
     */
    @RequestMapping(value = "/purchase",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> purchase(@RequestParam(name="studentGoodsId",required=true)Long studentGoodsId, Goods goods){
        StudentGoods studentGoods = studentGoodsService.find(studentGoodsId);
        if(studentGoods == null){
            return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
        }
        BeanUtils.copyProperties(studentGoods,goods,"id","createTime","updateTime","status");
        if(goodsService.purchase(goods,studentGoods) == null){
            return Result.error(CodeMsg.ADMIN_STUDENT_GOODS_PURCHASE_ERROR);
        }
        return Result.success(true);
    }
}
