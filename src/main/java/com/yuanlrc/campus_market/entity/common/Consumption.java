package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * @author kuang
 * @description
 * @date 2022/2/22  15:48
 */
@Entity
@Table(name="ylrc_consumption")
@EntityListeners(AuditingEntityListener.class)
public class Consumption extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name="student_id")
    private Student student;

    @ValidateEntity(required=true)
    @Column(name="amount",nullable=false)
    private Integer amount;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Consumption{" +
            "student=" + student +
            ", amount=" + amount +
            '}';
    }
}
