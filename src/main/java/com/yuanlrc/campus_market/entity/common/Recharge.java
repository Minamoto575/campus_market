package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.entity.admin.User;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * @author kuang
 * @description
 * @date 2022/2/22  15:39
 */
@Entity
@Table(name="ylrc_recharge")
@EntityListeners(AuditingEntityListener.class)
public class Recharge  extends BaseEntity{

    // private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name="student_id")
    private Student student;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @Column(name="amount")
    private float amount;

    @Column(name="type")
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Recharge{" +
            "student=" + student +
            ", user=" + user +
            ", amount=" + amount +
            ", type='" + type + '\'' +
            '}';
    }
}
