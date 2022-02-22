package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.common.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author kuang
 * @description
 * @date 2022/2/22  15:59
 */
public interface ChargeDao extends JpaRepository<Charge, Long>, JpaSpecificationExecutor<Charge> {


}
