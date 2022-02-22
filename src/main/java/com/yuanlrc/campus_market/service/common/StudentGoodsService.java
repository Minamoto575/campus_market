package com.yuanlrc.campus_market.service.common;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.dao.common.StudentGoodsDao;
import com.yuanlrc.campus_market.entity.common.StudentGoods;
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
import java.util.ArrayList;
import java.util.List;

/**
 * 学生图书Service
 */
@Service
public class StudentGoodsService {

    @Autowired
    private StudentGoodsDao studentGoodsDao;

    /**
     * 保存
     * @param studentGoods
     * @return
     */
    public StudentGoods save(StudentGoods studentGoods){
        return studentGoodsDao.save(studentGoods);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public StudentGoods find(Long id){
        return studentGoodsDao.find(id);
    }

    /**
     * 根据id删除
     * @param id
     */
    public void delete(Long id){
        studentGoodsDao.deleteById(id);
    }

    /**
     * 根据学生id查询
     * @param studentId
     * @return
     */
    public List<StudentGoods> findByStudentId(Long studentId){
        return studentGoodsDao.findByStudentIdOrderByStatusAscCreateTimeDesc(studentId);
    }

    /**
     * 根据id和学生id查询
     * @param id
     * @param studentId
     * @return
     */
    public StudentGoods findByIdAndStudentId(Long id,Long studentId){
        return studentGoodsDao.findByIdAndStudentId(id,studentId);
    }

    public PageBean<StudentGoods> findList(PageBean<StudentGoods> pageBean, StudentGoods studentGoods){

        Specification<StudentGoods> specification = new Specification<StudentGoods>() {
            private static final long serialVersionUID = 1L;

            @Override
            public Predicate toPredicate(Root<StudentGoods> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.like(root.get("name"), "%" + (studentGoods.getName() == null ? "" : studentGoods.getName()) + "%");
                if(studentGoods.getStudent() != null && studentGoods.getStudent().getId() != null){
                    Predicate equal1 = criteriaBuilder.equal(root.get("student"), studentGoods.getStudent().getId());
                    predicate = criteriaBuilder.and(predicate,equal1);
                }
                if(studentGoods.getGoodsCategory() != null && studentGoods.getGoodsCategory().getId() != null){
                    Predicate equal2 = criteriaBuilder.equal(root.get("goodsCategory"), studentGoods.getGoodsCategory().getId());
                    predicate = criteriaBuilder.and(predicate,equal2);
                }
                return predicate;
            }
        };

        List<Sort.Order> orders = new ArrayList<>();
        orders.add(new Sort.Order(Sort.Direction.ASC, "status"));
        orders.add(new Sort.Order(Sort.Direction.DESC, "createTime"));

        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), new Sort(orders));
        Page<StudentGoods> findAll = studentGoodsDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

}
