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
     * @param  pageBean
     * @param recharge
     * @author kuang
     * @date 2022/2/28
     */

    // @RequestParam(value="studentSn", required=false) String studentSn,
    // @RequestParam(value="userName",required=false) String userName
    @GetMapping("/recharge")
    public String listRecharge(Model model, PageBean<Recharge> pageBean,Recharge recharge) {
        User userLogin  = (User) SessionUtil.get(SessionConstant.SESSION_USER_LOGIN_KEY);
        if(userLogin==null){
            return "/system/login";
        }


        if(recharge.getStudent()!=null&&recharge.getStudent().getSn()!=null){
            Student student = studentService.findBySn(recharge.getStudent().getSn());
            if(student!=null){
                recharge.setStudent(student);
            }
        }

        if(recharge.getUser()!=null&&recharge.getUser().getUsername()!=null){
            User user = userService.findByUsername(recharge.getUser().getUsername());
            if(user!=null){
                recharge.setUser(user);
            }
        }

        System.out.println(recharge.getStudent());
        System.out.println(recharge.getUser());

        model.addAttribute("title", "充值记录");
        model.addAttribute("sn",recharge.getStudent()==null?null:recharge.getStudent().getSn());
        model.addAttribute("name",recharge.getUser()==null?null:recharge.getUser().getUsername());

        if(recharge.getStudent()!=null){
            model.addAttribute("pageBean",rechargeService.listByStudent(pageBean,recharge.getStudent()));
        }else if(recharge.getUser()!=null){
            model.addAttribute("pageBean",rechargeService.listByUser(pageBean,recharge.getUser()));
        }else{
            model.addAttribute("pageBean",rechargeService.listAll(pageBean));
        }

        return "admin/money/recharge";
    }

}
