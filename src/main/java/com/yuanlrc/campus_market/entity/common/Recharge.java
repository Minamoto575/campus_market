package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.annotion.ValidateEntity;

import javax.persistence.Column;
import java.time.LocalDateTime;

/**
 * @author kuang
 * @description
 * @date 2022/2/22  15:39
 */
public class Recharge {

    private Long id;

    @ValidateEntity(required=true)
    @Column(name="student_id",nullable=false)
    private Long studentId;

    @ValidateEntity(required=true)
    @Column(name="user_id",nullable=false)
    private Long userId;

    @ValidateEntity(required=true)
    @Column(name="create_time",nullable=false)
    private LocalDateTime createTime;

    @ValidateEntity(required=true)
    @Column(name="amount",nullable=false)
    private Integer amount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Recharge{" +
            "id=" + id +
            ", studentId=" + studentId +
            ", userId=" + userId +
            ", createTime=" + createTime +
            ", amount=" + amount +
            '}';
    }
}
