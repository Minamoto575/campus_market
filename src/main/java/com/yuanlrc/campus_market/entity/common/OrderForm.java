package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 订单实体类
 */
@Entity
@Table(name="order_form")
@EntityListeners(AuditingEntityListener.class)
public class OrderForm extends BaseEntity{

    public static final int IS_USE = 1;//使用优惠券
    public static final int NOT_USE = 2;//未使用优惠券

    @ManyToOne
    @JoinColumn(name="student_id")
    private Student student;//所属学生

    @ManyToOne
    @JoinColumn(name="goods_id")
    private Goods goods;//图书

    @Column(name="sell_price")
    private Float sellPrice;//售价

    @Column(name = "is_use")
    private int isUse;//是否使用优惠券

    @Column(name = "pay_price")
    private Float payPrice;//实际支付价格

    @ValidateEntity(required = true,errorRequiredMsg = "收货地址不能为空",requiredLeng = true,minLength = 0,errorMinLengthMsg = "收货地址不能为空",
    maxLength = 50,errorMaxLengthMsg = "收货地址最多50位")
    @Column(name = "place")
    private String place;//收货地址

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Float getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(Float sellPrice) {
        this.sellPrice = sellPrice;
    }

    public int getIsUse() {
        return isUse;
    }

    public void setIsUse(int isUse) {
        this.isUse = isUse;
    }

    public Float getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(Float payPrice) {
        this.payPrice = payPrice;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    @Override
    public String toString() {
        return "OrderForm{" +
                "student=" + student +
                ", goods=" + goods +
                ", sellPrice=" + sellPrice +
                ", isUse=" + isUse +
                ", payPrice=" + payPrice +
                ", place='" + place + '\'' +
                '}';
    }
}
