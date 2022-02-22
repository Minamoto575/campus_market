package com.yuanlrc.campus_market.controller.admin;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.entity.common.OrderForm;
import com.yuanlrc.campus_market.entity.common.Student;
import com.yuanlrc.campus_market.service.common.OrderFormService;
import com.yuanlrc.campus_market.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台订单列表
 */
@Controller
@RequestMapping("/admin/order_form")
public class OrderFormController {

    @Autowired
    private OrderFormService orderFormService;
    @Autowired
    private StudentService studentService;

    /**
     * 订单列表
     * @param model
     * @param orderForm
     * @param pageBean
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model, OrderForm orderForm, PageBean<OrderForm> pageBean){
        if(orderForm.getStudent() != null && orderForm.getStudent().getSn() != null){
            Student student = studentService.findBySn(orderForm.getStudent().getSn());
            if(student != null){
                orderForm.setStudent(student);
            }
        }
        model.addAttribute("title", "订单列表");
        model.addAttribute("name", orderForm.getGoods() == null ? null : orderForm.getGoods().getName());
        model.addAttribute("sn", orderForm.getStudent() == null ? null : orderForm.getStudent().getSn());
        model.addAttribute("pageBean", orderFormService.findList(pageBean,orderForm));
        return "admin/order_form/list";
    }

}
