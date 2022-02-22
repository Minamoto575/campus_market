package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.common.OrderForm;
import com.yuanlrc.campus_market.entity.common.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 订单Dao
 */
@Repository
public interface OrderFormDao extends JpaRepository<OrderForm,Long>, JpaSpecificationExecutor<OrderForm> {

    /**
     * 根据id查找
     * @param id
     * @return
     */
    @Query("select o from OrderForm o where id = :id")
    OrderForm find(@Param("id")Long id);

    /**
     * 根据学生查询
     * @param student
     * @return
     */
    List<OrderForm> findByStudent(Student student);
}
