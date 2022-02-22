package com.yuanlrc.campus_market.service.common;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.dao.common.OrderFormDao;
import com.yuanlrc.campus_market.dao.common.StudentDao;
import com.yuanlrc.campus_market.entity.common.Goods;
import com.yuanlrc.campus_market.entity.common.OrderForm;
import com.yuanlrc.campus_market.entity.common.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.math.BigDecimal;
import java.util.List;

/**
 * 订单Service
 */
@Service
public class OrderFormService {

    @Autowired
    private OrderFormDao orderFormDao;
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private GoodsService goodsService;

    /**
     * 保存
     * @param orderForm
     * @return
     */
    @Transactional
    public OrderForm save(OrderForm orderForm, Student student, Integer discountType, Goods goods){
        goods.setStatus(Goods.GOODS_STATUS_SOLD);
        goodsService.save(goods);

        orderForm.setGoods(goods);
        Float payPrice = 0f;
        if(discountType == 1){
            payPrice = (BigDecimal.valueOf(orderForm.getSellPrice()).subtract(BigDecimal.TEN)).floatValue();
            student.setDiscountCoupon(Student.NOT_COUPON);
            orderForm.setIsUse(OrderForm.IS_USE);
        }else{
            payPrice = orderForm.getSellPrice();
            orderForm.setIsUse(OrderForm.NOT_USE);
        }
        studentDao.save(student);
        orderForm.setStudent(student);
        orderForm.setPayPrice(payPrice);

        return orderFormDao.save(orderForm);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public OrderForm find(Long id){
        return orderFormDao.find(id);
    }


    /**
     * 分页查询
     * @param pageBean
     * @param orderForm
     * @return
     */
    public PageBean<OrderForm> findList(PageBean<OrderForm> pageBean,OrderForm orderForm){
        Specification<OrderForm> specification = new Specification<OrderForm>() {
            private static final long serialVersionUID = 1L;

            @Override
            public Predicate toPredicate(Root<OrderForm> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.like(root.get("place"), "%%");
                if(orderForm.getStudent() != null && orderForm.getStudent().getId() != null){
                    Predicate equal1 = criteriaBuilder.equal(root.get("student"), orderForm.getStudent().getId());
                    predicate = criteriaBuilder.and(predicate,equal1);
                }
                if(orderForm.getGoods() != null){
                    Predicate like = criteriaBuilder.like(root.get("goods").get("name"), "%" + (orderForm.getGoods().getName() == null ? "" : orderForm.getGoods().getName()) + "%");
                    predicate = criteriaBuilder.and(predicate,like);
                }
                return predicate;
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "id","createTime");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<OrderForm> findAll = orderFormDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 根据学生查询
     * @param student
     * @return
     */
    public List<OrderForm> findByStudent(Student student){
        return orderFormDao.findByStudent(student);
    }
}
