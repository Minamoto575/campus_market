package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.common.StudentGoods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 学生图书Dao
 */
@Repository
public interface StudentGoodsDao extends JpaRepository<StudentGoods,Long> , JpaSpecificationExecutor<StudentGoods> {

    /**
     * 根据id查找
     * @param id
     * @return
     */
    @Query("select s from StudentGoods s where id = :id")
    StudentGoods find(@Param("id")Long id);

    /**
     * 根据学生id删除
     * @param studentId
     * @return
     */
    List<StudentGoods> findByStudentIdOrderByStatusAscCreateTimeDesc(Long studentId);

    /**
     * 根据id和学生id查询
     * @param id
     * @param studentId
     * @return
     */
    StudentGoods findByIdAndStudentId(Long id,Long studentId);
}
