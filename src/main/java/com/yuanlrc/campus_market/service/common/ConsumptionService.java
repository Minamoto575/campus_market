package com.yuanlrc.campus_market.service.common;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.dao.common.ConsumptionDao;
import com.yuanlrc.campus_market.entity.common.Consumption;
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
import java.util.List;

/**
 * @author kuang
 * @description
 * @date 2022/2/22  15:58
 */
@Service
public class ConsumptionService {

    @Autowired
    public ConsumptionDao consumptionDao;

    /**
     * @description 查找所有消费记录
     * @author kuang
     * @date 2022/2/22
     */
    public PageBean<Consumption> listAll(PageBean<Consumption> pageBean){
        Sort sort = Sort.by(Sort.Direction.DESC, "id","createTime");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<Consumption> findAll = consumptionDao.findAll(pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * @description 根据学生查询消费记录
     * @param student
     * @author kuang
     * @date 2022/2/22
     */
    public PageBean<Consumption> listByStudent(PageBean<Consumption> pageBean,Student student){
        Specification<Consumption> specification = new Specification<Consumption>() {
            private static final long serialVersionUID = 1L;
            @Override
            public Predicate toPredicate(Root<Consumption> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return criteriaBuilder.equal(root.get("student_id"), student.getId());
            }
        };
        return list(specification,pageBean);
    }

    /**
     * @description 消费记录插入
     * @param consumption
     * @author kuang
     * @date 2022/2/22
     */
    public Consumption save(Consumption consumption){
        return consumptionDao.save(consumption);
    }


    /**
     * @description 根据条件查询
     * @param  specification
     * @param pageBean
     * @author kuang
     * @date 2022/2/23
     */
    private PageBean<Consumption> list(Specification<Consumption> specification, PageBean<Consumption> pageBean){
        Sort sort = Sort.by(Sort.Direction.DESC, "id","createTime");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<Consumption> findAll = consumptionDao.findAll(specification,pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }


}
