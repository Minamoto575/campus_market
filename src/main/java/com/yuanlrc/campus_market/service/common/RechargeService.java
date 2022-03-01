package com.yuanlrc.campus_market.service.common;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.dao.common.RechargeDao;
import com.yuanlrc.campus_market.entity.admin.User;
import com.yuanlrc.campus_market.entity.common.Recharge;
import com.yuanlrc.campus_market.entity.common.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @author kuang
 * @description 充值服务层
 * @date 2022/2/22  15:58
 */
@Service
public class RechargeService {
    @Autowired
    private RechargeDao rechargeDao;

    /**
     * @description 分页列出所有充值记录
     * @param pageBean
     * @author kuang
     * @date 2022/2/23
     */
    public PageBean<Recharge> listAll(PageBean<Recharge> pageBean){
        Sort sort = Sort.by(Sort.Direction.DESC, "createTime","id");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<Recharge> findAll = rechargeDao.findAll(pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * @description 根据学生分页查找充值记录
     * @param  pageBean
     * @param student
     * @author kuang
     * @date 2022/2/23
     */
    public PageBean<Recharge> listByStudent(PageBean<Recharge> pageBean,Student student){
        Specification<Recharge> specification = new Specification<Recharge>() {
            private static final long serialVersionUID = 1L;
            @Override
            public Predicate toPredicate(Root<Recharge> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return criteriaBuilder.equal(root.get("student"), student.getId());
            }
        };
        return list(specification,pageBean);
    }

    /**
     * @description 根据操作者分页查找充值记录
     * @param  pageBean
     * @param user
     * @author kuang
     * @date 2022/2/23
     */
    public PageBean<Recharge> listByUser(PageBean<Recharge> pageBean,User user){
        Specification<Recharge> specification = new Specification<Recharge>() {
            private static final long serialVersionUID = 1L;
            @Override
            public Predicate toPredicate(Root<Recharge> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return criteriaBuilder.equal(root.get("user"), user.getId());
            }
        };
        return list(specification,pageBean);
    }

    /**
     * @description 插入充值记录
     * @param recharge
     * @author kuang
     * @date 2022/2/22
     */
    public Recharge save(Recharge recharge){
        return rechargeDao.save(recharge);
    }

    /**
     * @description 具体条件查询的方法
     * @param  specification
     * @param pageBean
     * @author kuang
     * @date 2022/2/23
     */
    private PageBean<Recharge> list(Specification<Recharge> specification, PageBean<Recharge> pageBean){
        Sort sort = Sort.by(Sort.Direction.DESC,"createTime","id");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<Recharge> findAll = rechargeDao.findAll(specification,pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

}
