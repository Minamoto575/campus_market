// package com.yuanlrc.campus_market.controller.admin;
//
// import com.yuanlrc.campus_market.bean.CodeMsg;
// import com.yuanlrc.campus_market.bean.PageBean;
// import com.yuanlrc.campus_market.bean.Result;
// import com.yuanlrc.campus_market.constant.SessionConstant;
// import com.yuanlrc.campus_market.entity.admin.User;
// import com.yuanlrc.campus_market.entity.common.Recharge;
// import com.yuanlrc.campus_market.entity.common.Student;
// import com.yuanlrc.campus_market.service.admin.UserService;
// import com.yuanlrc.campus_market.service.common.RechargeService;
// import com.yuanlrc.campus_market.service.common.StudentService;
// import com.yuanlrc.campus_market.util.SessionUtil;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.*;
//
// /**
//  * @author kuang
//  * @description 充值控制器
//  * @date 2022/2/23  9:23
//  */
// @Controller
// @RequestMapping("/admin/recharge")
// public class RechargeController {
//     @Autowired
//     private RechargeService rechargeService;
//     @Autowired
//     private StudentService studentService;
//     @Autowired
//     private UserService userService;
//
//
//     /**
//      * @description 插入充值记录
//      * @param  amount  充值金额
//      * @param studentId  充值的学生
//      * @author kuang
//      * @date 2022/2/23
//      */
//     @PostMapping(value="/insert")
//     @ResponseBody
//     public Result<Boolean> insert(@RequestParam(value = "amount",required=true) int amount,
//                                   @RequestParam(value = "studentId", required=true) Long studentId){
//         User user = (User) SessionUtil.get(SessionConstant.SESSION_USER_LOGIN_KEY) ;
//         if(user == null){
//             return Result.error(CodeMsg.ADMIN_NO_RIGHT);
//         }
//         Student student = studentService.findById(studentId);
//         if(student==null){
//             return Result.error(CodeMsg.ADMIN_STUDENT_NO_EXIST);
//         }
//         if(amount<=0){
//             return Result.error(CodeMsg.HOME_AMOUNT_ERROR);
//         }
//         Recharge recharge = new Recharge();
//         recharge.setStudent(student);
//         recharge.setUser(user);
//         recharge.setAmount(amount);
//         rechargeService.save(recharge);
//         return Result.success(true);
//     }
//
//     /**
//      * @description 获取所有充值记录
//      * @param  model
//      * @param pageBean
//      * @author kuang
//      * @date 2022/2/23
//      */
//     @GetMapping("/listAll")
//     public String listAll(Model model, PageBean<Recharge> pageBean){
//         model.addAttribute("title", "充值列表");
//         model.addAttribute("pageBean", rechargeService.listAll(pageBean));
//         return "/admin/recharge/listAll";
//     }
//
//     @GetMapping("/listByStudent")
//     public String listByStudent(Model model, PageBean<Recharge> pageBean,
//                                 @RequestParam("studentId") Long studentId){
//         Student student = studentService.findById(studentId);
//         model.addAttribute("title", "消费记录列表");
//         model.addAttribute("studentSn",student.getSn());
//         model.addAttribute("pageBean", rechargeService.listByStudent(pageBean,student));
//         return "/admin/consumption/listByStudent";
//     }
//     @GetMapping("/listByUser")
//     public String listByUser(Model model, PageBean<Recharge> pageBean,
//                                 @RequestParam("userId") Long userId){
//         User user = userService.find(userId);
//         model.addAttribute("title", "消费记录列表");
//         model.addAttribute("userName",user.getUsername());
//         model.addAttribute("pageBean", rechargeService.listByUser(pageBean,user));
//         return "/admin/consumption/listByUser";
//     }
//
// }
