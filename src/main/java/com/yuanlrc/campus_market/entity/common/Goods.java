package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 图书实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_goods")
@EntityListeners(AuditingEntityListener.class)
public class Goods extends BaseEntity{

	public static final int GOODS_STATUS_NOT_UP = 0;//未上架
	public static final int GOODS_STATUS_UP = 1;//上架
	public static final int GOODS_STATUS_DOWN = 2;//下架
	public static final int GOODS_STATUS_SOLD = 3;//已售出


	public static final int GOODS_RECOMMEND_OFF = 0;//不推荐
	public static final int GOODS_RECOMMEND_ON = 1;//推荐


	private static final long serialVersionUID = 1L;


	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;//所属学生

	@ValidateEntity(required=true,requiredLeng=true,minLength=1,maxLength=30,errorRequiredMsg="图书名称不能为空!",errorMinLengthMsg="图书名称长度需大于1!",errorMaxLengthMsg="图书名称长度不能大于30!")
	@Column(name="name",nullable=false,length=32)
	private String name;//图书名称
	
	@ManyToOne
	@JoinColumn(name="goods_category_id")
	private GoodsCategory goodsCategory;//图书分类

	@ValidateEntity(required=true,errorRequiredMsg="请填写购买价格",requiredMinValue=true,errorMinValueMsg="购买价格不能小于0")
	@Column(name="buy_price",nullable=false,length=8)
	private Float buyPrice;//购买价格
	
	@ValidateEntity(required=true,errorRequiredMsg="请填写出售价格",requiredMinValue=true,errorMinValueMsg="出售价格不能小于0")
	@Column(name="sell_price",nullable=false,length=8)
	private Float sellPrice;//出售价格
	
	@ValidateEntity(required=true,errorRequiredMsg="请上传图片")
	@Column(name="photo",nullable=false,length=128)
	private String photo;//图书图片
	
	@Column(name="status",nullable=false,length=1)
	private int status = GOODS_STATUS_NOT_UP;//图书状态，默认未上架

	@Column(name="recommend",nullable=false,length=1)
	private int recommend = GOODS_RECOMMEND_OFF;//是否推荐
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=15,maxLength=1000,errorRequiredMsg="图书详情描述不能为空!",errorMinLengthMsg="图书详情描述长度最小为15!",errorMaxLengthMsg="图书详情描述长度不能大于1000!")
	@Column(name="content",nullable=false,length=1024)
	private String content;//图书详情描述
	
	@Column(name="view_number",nullable=false,length=8)
	private int viewNumber = 0;//图书浏览量

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


	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewNumber() {
		return viewNumber;
	}

	public void setViewNumber(int viewNumber) {
		this.viewNumber = viewNumber;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public String toString() {
		return "Goods{" +
			"student=" + student +
			", name='" + name + '\'' +
			", goodsCategory=" + goodsCategory +
			", buyPrice=" + buyPrice +
			", sellPrice=" + sellPrice +
			", photo='" + photo + '\'' +
			", status=" + status +
			", recommend=" + recommend +
			", content='" + content + '\'' +
			", viewNumber=" + viewNumber +
			'}';
	}
}
