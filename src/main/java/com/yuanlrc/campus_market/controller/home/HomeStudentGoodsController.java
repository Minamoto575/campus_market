package com.yuanlrc.campus_market.controller.home;

import com.yuanlrc.campus_market.bean.CodeMsg;
import com.yuanlrc.campus_market.bean.Result;
import com.yuanlrc.campus_market.constant.SessionConstant;
import com.yuanlrc.campus_market.entity.common.Student;
import com.yuanlrc.campus_market.entity.common.StudentGoods;
import com.yuanlrc.campus_market.service.common.StudentGoodsService;
import com.yuanlrc.campus_market.util.SessionUtil;
import com.yuanlrc.campus_market.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 学生图书前台管理
 */
@Controller
@RequestMapping("/home/student_goods")
public class HomeStudentGoodsController {

    @Autowired
    private StudentGoodsService studentGoodsService;

    /**
     * 图书编辑页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value="/edit_goods",method= RequestMethod.GET)
    public String edit_goods(@RequestParam(name="id",required=true)Long id, Model model){
        Student loginedStudent = (Student) SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
        StudentGoods studentGoods = studentGoodsService.findByIdAndStudentId(id, loginedStudent.getId());
        if(studentGoods == null){
            model.addAttribute("msg", "图书不存在！");
            return "error/runtime_error";
        }
        model.addAttribute("studentGoods", studentGoods);
        return "home/student_goods/edit_goods";
    }

    /**
     * 编辑表单提交
     * @param studentGoods
     * @return
     */
    @RequestMapping(value = "/edit_goods",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> editGoods(StudentGoods studentGoods){
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
        StudentGoods findById = studentGoodsService.findByIdAndStudentId(studentGoods.getId(), loginedStudent.getId());
        if(findById == null){
            return Result.error(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
        }
        if(findById.getStatus() == StudentGoods.HAS_BEEN_TO_BUY){
            return Result.error(CodeMsg.HOME_STUDENT_GOODS_STATUS_ERROR);
        }
        BeanUtils.copyProperties(studentGoods,findById,"id","createTime","updateTime","student","status");
        if(studentGoodsService.save(findById) == null){
            return Result.error(CodeMsg.HOME_STUDENT_GOODS_EDIT_NULL_ERROR);
        }

        return Result.success(true);
    }

    @RequestMapping(value="/detail",method= RequestMethod.GET)
    public String detail(@RequestParam(name="id",required=true)Long id, Model model){
        StudentGoods studentGoods = studentGoodsService.find(id);
        if(studentGoods == null){
            model.addAttribute("msg", "图书不存在！");
            return "error/runtime_error";
        }
        model.addAttribute("studentGoods", studentGoods);
        return "home/student_goods/detail";
    }

}
