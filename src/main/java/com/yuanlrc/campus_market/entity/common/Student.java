package com.yuanlrc.campus_market.entity.common;

import com.yuanlrc.campus_market.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

/**
 * 学生实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="studnet")
@EntityListeners(AuditingEntityListener.class)
public class Student extends BaseEntity{

	public static final int STUDENT_STATUS_ENABLE = 1;//状态可用
	public static final int STUDENT_STATUS_UNABLE = 0;//状态不可用

	public static final int HAVE_COUPON = 1;//有优惠券
	public static final int NOT_COUPON = 2;//无优惠券

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=6,maxLength=18,errorRequiredMsg="学号不能为空!",errorMinLengthMsg="学号长度需大于6!",errorMaxLengthMsg="学号长度不能大于18!")
	@Column(name="sn",nullable=false,length=18,unique=true)
	private String sn;//学生学号
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=6,maxLength=18,errorRequiredMsg="密码不能为空!",errorMinLengthMsg="密码长度需大于6!",errorMaxLengthMsg="密码长度不能大于18!")
	@Column(name="password",nullable=false,length=18)
	private String password;//学生登录密码
	
	@ValidateEntity(required=false)
	@Column(name="head_pic",length=128)
	private String headPic;//学生头像
	
	@ValidateEntity(required=false)
	@Column(name="nickname",length=32)
	private String nickname;//昵称
	
	@ValidateEntity(required=false)
	@Column(name="mobile",length=18)
	private String mobile;//手机号
	
	@ValidateEntity(required=true,minLength=5,maxLength=12,errorMinLengthMsg="qq号最小5位",errorMaxLengthMsg="qq号长度不能大于12")
	@Column(name="qq",length=18)
	private String qq;//QQ号
	
	@ValidateEntity(required=false)
	@Column(name="school",length=18)
	private String school;//所属学校
	
	@ValidateEntity(required=false)
	@Column(name="academy",length=18)
	private String academy;//所属学院
	
	@ValidateEntity(required=false)
	@Column(name="grade",length=18)
	private String grade;//所属年级
	
	@ValidateEntity(required=false)
	@Column(name="status",length=1)
	private int status = STUDENT_STATUS_ENABLE;//学生状态，默认可用

	@Column(name = "discount_coupon")
	private int discountCoupon = HAVE_COUPON;//是否有优惠券 默认有优惠券

	@Column(name = "balance")
	private float balance;

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDiscountCoupon() {
		return discountCoupon;
	}

	public void setDiscountCoupon(int discountCoupon) {
		this.discountCoupon = discountCoupon;
	}

	@Override
	public String toString() {
		return "Student{" +
			"sn='" + sn + '\'' +
			", password='" + password + '\'' +
			", headPic='" + headPic + '\'' +
			", nickname='" + nickname + '\'' +
			", mobile='" + mobile + '\'' +
			", qq='" + qq + '\'' +
			", school='" + school + '\'' +
			", academy='" + academy + '\'' +
			", grade='" + grade + '\'' +
			", status=" + status +
			", discountCoupon=" + discountCoupon +
			", balance=" + balance +
			'}';
	}
}
