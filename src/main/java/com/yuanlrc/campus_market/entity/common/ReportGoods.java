package com.yuanlrc.campus_market.entity.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yuanlrc.campus_market.annotion.ValidateEntity;

/**
 * 建议图书实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="report_goods")
@EntityListeners(AuditingEntityListener.class)
public class ReportGoods extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;//所属学生
	
	@ManyToOne
	@JoinColumn(name="goods_id")
	private Goods goods;//建议的图书
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=1,maxLength=1000,errorRequiredMsg="建议原因不能为空!",errorMinLengthMsg="建议原因长度需大于1!",errorMaxLengthMsg="建议原因长度不能大于1000!")
	@Column(name="content",nullable=false,length=1024)
	private String content;//建议原因

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "RrportGoods [student=" + student + ", goods=" + goods
				+ ", content=" + content + "]";
	}
	
	
}
