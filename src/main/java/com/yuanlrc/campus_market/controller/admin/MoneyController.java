package com.yuanlrc.campus_market.controller.admin;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.constant.SessionConstant;
import com.yuanlrc.campus_market.entity.admin.User;
import com.yuanlrc.campus_market.entity.common.Consumption;
import com.yuanlrc.campus_market.entity.common.Recharge;
import com.yuanlrc.campus_market.entity.common.Student;
import com.yuanlrc.campus_market.service.admin.UserService;
import com.yuanlrc.campus_market.service.common.ConsumptionService;
import com.yuanlrc.campus_market.service.common.RechargeService;
import com.yuanlrc.campus_market.service.common.StudentService;
import com.yuanlrc.campus_market.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author kuang
 * @description
 * @date 2022/2/25  15:56
 */

@RequestMapping("/admin/money")
@Controller
public class MoneyController {
    @Autowired
    ConsumptionService consumptionService;
    @Autowired
    RechargeService rechargeService;
    @Autowired
    UserService userService;
    @Autowired
    StudentService studentService;
    private final static String CONSUMPTION = "consumption";
    private final static String RECHARGE = "recharge";

    /**
     * @description 获取消费记录
     * @param  model
     * @param pageBean
     * @author kuang
     * @date 2022/2/25
     */
    @GetMapping("/consumption")
    public String listConsumption(Model model, PageBean<Consumption> pageBean) {
        User user  = (User) SessionUtil.get(SessionConstant.SESSION_USER_LOGIN_KEY);
        if(user==null){
            return "/system/login";
        }
        model.addAttribute("pageBean",consumptionService.listAll(pageBean));
        return "admin/money/consumption";
    }


    /**
     * @description
     * @param  model
     * @param pageBean
     * @author kuang
     * @date 2022/2/25
     */
    @GetMapping("/recharge")
    public String listRecharge(Model model, PageBean<Recharge> pageBean,
                               @RequestParam(value="studentId", required=false) Long studentId,
                               @RequestParam(value="userId",required=false) Long userId) {
        User user  = (User) SessionUtil.get(SessionConstant.SESSION_USER_LOGIN_KEY);
        if(user==null){
            return "/system/login";
        }
        // 获取充值u记录
        if(studentId!=null){
           Student studentSelected = studentService.findById(studentId);
           model.addAttribute("pageBean",rechargeService.listByStudent(pageBean,studentSelected));
        } else if(userId!=null){
            User userSelected = userService.find(userId);
            model.addAttribute("pageBean",rechargeService.listByUser(pageBean,userSelected));
        } else{
            model.addAttribute("pageBean",rechargeService.listAll(pageBean));
        }
        return "admin/money/recharge";
    }

}
