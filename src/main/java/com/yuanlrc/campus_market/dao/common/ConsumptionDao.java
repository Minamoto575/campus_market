package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.common.Comment;
import com.yuanlrc.campus_market.entity.common.Consumption;
import com.yuanlrc.campus_market.entity.common.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author kuang
 * @description 消费的dao
 * @date 2022/2/22  15:59
 */
@Repository
public interface ConsumptionDao extends JpaRepository<Consumption, Long>, JpaSpecificationExecutor<Consumption> {


    /**
     * @description 根据学生查询消费记录
     * @param student
     * @author kuang
     * @date 2022/2/22
     */
    List<Consumption> findByStudent(Student student);
}
