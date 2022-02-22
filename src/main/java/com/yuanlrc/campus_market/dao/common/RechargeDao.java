package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.common.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author kuang
 * @description
 * @date 2022/2/22  15:52
 */
public interface RechargeDao extends JpaRepository<Recharge,Long>, JpaSpecificationExecutor<Recharge> {


    /**
     * @description 查找所以充值记录
     * @author kuang
     * @date 2022/2/22
     */
    List<Recharge> findAll();

    /**
     * 根据学生id查询
     * @param studentId
     * @return
     */
    List<Recharge> findByStudentId(Long studentId);

    /**
     * 根据学生id查询
     * @param userId
     * @return
     */
    List<Recharge> findByUserId(Long userId);



}
