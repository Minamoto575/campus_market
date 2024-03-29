package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 求购图书实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="wanted_goods")
@EntityListeners(AuditingEntityListener.class)
public class WantedGoods extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;//所属学生
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=1,maxLength=30,errorRequiredMsg="图书名称不能为空!",errorMinLengthMsg="图书名称长度需大于1!",errorMaxLengthMsg="图书名称长度不能大于30!")
	@Column(name="name",nullable=false,length=32)
	private String name;//图书名称
	
	@ValidateEntity(required=true,errorRequiredMsg="请填写期望价格",requiredMinValue=true,errorMinValueMsg="期望价格不能小于0")
	@Column(name="sell_price",nullable=false,length=8)
	private Float sellPrice;//期望价格
	
	@ValidateEntity(required=true,minLength=1,maxLength=128,errorRequiredMsg="期望交易地点不能为空!",errorMinLengthMsg="期望交易地点长度需大于1!",errorMaxLengthMsg="期望交易地点长度不能大于100!")
	@Column(name="trade_place",nullable=false,length=128)
	private String tradePlace;//期望交易地点
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=1,maxLength=1000,errorRequiredMsg="图书详情描述不能为空!",errorMinLengthMsg="图书详情描述长度需大于1!",errorMaxLengthMsg="图书详情描述长度不能大于1000!")
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

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Float getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(Float sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getTradePlace() {
		return tradePlace;
	}

	public void setTradePlace(String tradePlace) {
		this.tradePlace = tradePlace;
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

	@Override
	public String toString() {
		return "WantedGoods [student=" + student + ", name=" + name
				+ ", sellPrice=" + sellPrice + ", tradePlace=" + tradePlace
				+ ", content=" + content + ", viewNumber=" + viewNumber + "]";
	}

	
	


	
}
