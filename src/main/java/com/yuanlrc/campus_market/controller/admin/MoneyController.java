package com.yuanlrc.campus_market.controller.admin;

import com.yuanlrc.campus_market.bean.CodeMsg;
import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.bean.Result;
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
import com.yuanlrc.campus_market.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
     * @description 管理员获取消费记录
     * @param  model
     * @param  pageBean
     * @param studentSn
     * @author kuang
     * @date 2022/3/1
     */
    @GetMapping("/consumption")
    public String listConsumption(Model model,PageBean<Consumption> pageBean,
                                  @RequestParam(value="studentSn",required=false) String studentSn) {
        // 验证权限
        User user  = (User) SessionUtil.get(SessionConstant.SESSION_USER_LOGIN_KEY);
        if(user==null){
            return "/system/login";
        }
        // 查询

        if(StringUtil.isBlank(studentSn)){
            model.addAttribute("pageBean",consumptionService.listAll(pageBean));
            model.addAttribute("sn",null);
        }else{
            Student student = studentService.findBySn(studentSn);
            if(student==null){
                student = new Student();
                student.setId((long) -1);
            }
            model.addAttribute("pageBean",consumptionService.listByStudent(pageBean,student));
            model.addAttribute("sn",studentSn);
        }
        model.addAttribute("title","消费记录");

        return "admin/money/consumption";
    }


    /**
     * @description  管理员获取充值记录
     * @param  model
     * @param  pageBean
     * @param recharge
     * @author kuang
     * @date 2022/2/28
     */
    @GetMapping("/recharge")
    public String listRecharge(Model model, PageBean<Recharge> pageBean,Recharge recharge) {

        // 验证权限
        User userLogin  = (User) SessionUtil.get(SessionConstant.SESSION_USER_LOGIN_KEY);
        if(userLogin==null){
            return "/system/login";
        }

        User user = recharge.getUser();
        Student student = recharge.getStudent();

        // 获取对应的学生
        if(student!=null&&!StringUtil.isBlank(student.getSn())){
            Student studentFound = studentService.findBySn(student.getSn());
            if(studentFound!=null){
                recharge.setStudent(studentFound);
            }
        }
        // 获取对应的管理员
        if(user!=null&&!StringUtil.isBlank(user.getUsername())){
            User userFound = userService.findByUsername(user.getUsername());
            if(userFound!=null){
                recharge.setUser(userFound);
            }
        }

        // 更新用户和学生
        user = recharge.getUser();
        student = recharge.getStudent();

        // 查询
        model.addAttribute("title", "充值记录");
        model.addAttribute("sn",student==null?null:student.getSn());
        model.addAttribute("name",user==null?null:user.getUsername());
        if(student!=null&&!StringUtil.isBlank(student.getSn())){
            model.addAttribute("pageBean",rechargeService.listByStudent(pageBean,student));
        }else if(user!=null&&!StringUtil.isBlank(user.getUsername())){
            model.addAttribute("pageBean",rechargeService.listByUser(pageBean,user));
        }else{
            model.addAttribute("pageBean",rechargeService.listAll(pageBean));
        }

        return "admin/money/recharge";
    }


    @RequestMapping(value="/add",method=RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("title","菜单列表");
        return "admin/money/add";
    }

    @PostMapping("/add")
    @ResponseBody
    public Result<Boolean> add(Recharge recharge){
        // 验证管理员权限
        User userLogin  = (User) SessionUtil.get(SessionConstant.SESSION_USER_LOGIN_KEY);
        if(userLogin==null){
            return Result.error(CodeMsg.ADMIN_NO_RIGHT);
        }

        // 验证学生
        Student student = recharge.getStudent();
        if(student==null||StringUtil.isBlank(student.getSn())){
            return Result.error(CodeMsg.ADMIN_STUDENT_NO_EXIST);
        }
        student = studentService.findBySn(student.getSn());
        if(student==null){
            return Result.error(CodeMsg.ADMIN_STUDENT_NO_EXIST);
        }

        // 验证充值金额
        if(recharge.getAmount()<=0){
            return Result.error(CodeMsg.ADMIN_AMOUNT_ERROR);
        }

        // 记录充值
        recharge.setUser(userLogin);
        recharge.setStudent(student);
        recharge.setType("线下充值");
        rechargeService.save(recharge);

        // 更新学生余额
        student.setBalance(student.getBalance()+recharge.getAmount());
        studentService.save(student);

        return Result.success(true);
    }



}
