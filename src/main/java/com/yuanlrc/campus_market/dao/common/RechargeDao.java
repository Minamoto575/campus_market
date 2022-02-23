package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.admin.User;
import com.yuanlrc.campus_market.entity.common.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author kuang
 * @description 充值的dao
 * @date 2022/2/22  15:52
 */
@Repository
public interface RechargeDao extends JpaRepository<Recharge,Long>, JpaSpecificationExecutor<Recharge> {

    /**
     * 根据学生查询
     * @param student
     * @return
     */
    List<Recharge> findByStudent(Student student);

    /**
     * 根据操作者查询
     * @param user
     * @return
     */
    List<Recharge> findByUser(User user);

}
