package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 学生图书
 */
@Entity
@Table(name="student_goods")
@EntityListeners(AuditingEntityListener.class)
public class StudentGoods extends BaseEntity{

    public static final int NOT_BE_ACQUIRED = 1;//未被收购
    public static final int HAS_BEEN_TO_BUY = 2;//已被收购

    @ManyToOne
    @JoinColumn(name="student_id")
    private Student student;//所属学生

    @ValidateEntity(required=true,requiredLeng=true,minLength=1,maxLength=18,errorRequiredMsg="图书名称不能为空!",errorMinLengthMsg="图书名称长度需大于1!",errorMaxLengthMsg="图书名称长度不能大于18!")
    @Column(name="name",nullable=false,length=32)
    private String name;//图书名称

    @ManyToOne
    @JoinColumn(name="goods_category_id")
    private GoodsCategory goodsCategory;//图书分类

    @ValidateEntity(required=true,errorRequiredMsg="请填写购买价格",requiredMinValue=true,errorMinValueMsg="购买价格不能小于0")
    @Column(name="buy_price",nullable=false,length=8)
    private Float buyPrice;//购买价格

    @ValidateEntity(required=true,errorRequiredMsg="请填写期待价格",requiredMinValue=true,errorMinValueMsg="期待价格不能小于0")
    @Column(name="sell_price",nullable=false,length=8)
    private Float sellPrice;//期待价格

    @ValidateEntity(required=true,errorRequiredMsg="请上传图片")
    @Column(name="photo",nullable=false,length=128)
    private String photo;//图书图片

    @Column(name="status",nullable=false,length=1)
    private int status = NOT_BE_ACQUIRED;//图书状态，默认未被收购

    @ValidateEntity(required=true,requiredLeng=true,minLength=15,maxLength=1000,errorRequiredMsg="图书详情描述不能为空!",errorMinLengthMsg="图书详情描述长度最小为15!",errorMaxLengthMsg="图书详情描述长度不能大于1000!")
    @Column(name="content",nullable=false,length=1024)
    private String content;//图书详情描述


    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public GoodsCategory getGoodsCategory() {
        return goodsCategory;
    }

    public void setGoodsCategory(GoodsCategory goodsCategory) {
        this.goodsCategory = goodsCategory;
    }

    public Float getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(Float buyPrice) {
        this.buyPrice = buyPrice;
    }

    public Float getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(Float sellPrice) {
        this.sellPrice = sellPrice;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "StudentGoods{" +
                "student=" + student +
                ", name='" + name + '\'' +
                ", goodsCategory=" + goodsCategory +
                ", buyPrice=" + buyPrice +
                ", sellPrice=" + sellPrice +
                ", photo='" + photo + '\'' +
                ", status=" + status +
                ", content='" + content + '\'' +
                '}';
    }
}
