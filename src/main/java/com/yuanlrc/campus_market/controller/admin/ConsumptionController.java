package com.yuanlrc.campus_market.controller.admin;

import com.yuanlrc.campus_market.bean.CodeMsg;
import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.bean.Result;
import com.yuanlrc.campus_market.constant.SessionConstant;
import com.yuanlrc.campus_market.entity.common.Consumption;
import com.yuanlrc.campus_market.entity.common.Student;
import com.yuanlrc.campus_market.service.common.ConsumptionService;
import com.yuanlrc.campus_market.service.common.StudentService;
import com.yuanlrc.campus_market.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author kuang
 * @description 消费记录控制器
 * @date 2022/2/23  14:22
 */
@RequestMapping("/admin/consumption")
@Controller
public class ConsumptionController {
    @Autowired
    ConsumptionService consumptionService;
    @Autowired
    StudentService studentService;

    /**
     * @description 插入消费记录
     * @param amount
     * @author kuang
     * @date 2022/2/23
     */
    @PostMapping(value="/insert")
    @ResponseBody
    public Result<Boolean> insert(@RequestParam(value = "amount",required=true) int amount){

        Student student = (Student) SessionUtil.get(SessionConstant.SESSION_STUDENT_LOGIN_KEY);
        if(student==null){
            return Result.error(CodeMsg.ADMIN_STUDENT_NO_EXIST);
        }
        if(amount<=0){
            return Result.error(CodeMsg.HOME_AMOUNT_ERROR);
        }
        Consumption consumption = new Consumption();
        consumption.setAmount(amount);
        consumption.setStudent(student);
        consumptionService.save(consumption);
        return Result.success(true);
    }

    /**
     * @description 获取所有消费记录
     * @param  model
     * @param pageBean
     * @author kuang
     * @date 2022/2/23
     */
    @GetMapping("/listAll")
    public String listAll(Model model, PageBean<Consumption> pageBean){
        model.addAttribute("title", "消费记录列表");
        model.addAttribute("pageBean", consumptionService.listAll(pageBean));
        return "/admin/consumption/listAll";
    }


    @GetMapping("/listByStudent")
    public String listByStudent(Model model, PageBean<Consumption> pageBean,
                                @RequestParam("studentId") Long studentId){
        Student student = studentService.findById(studentId);
        model.addAttribute("title", "消费记录列表");
        model.addAttribute("studentSn",student.getSn());
        model.addAttribute("pageBean", consumptionService.listAll(pageBean));
        return "/admin/consumption/listByStudent";
    }

}
