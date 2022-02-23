package com.yuanlrc.campus_market.service.common;

import com.yuanlrc.campus_market.bean.PageBean;
import com.yuanlrc.campus_market.dao.common.RechargeDao;
import com.yuanlrc.campus_market.entity.admin.User;
import com.yuanlrc.campus_market.entity.common.OrderForm;
import com.yuanlrc.campus_market.entity.common.Recharge;
import com.yuanlrc.campus_market.entity.common.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kuang
 * @description 充值服务层
 * @date 2022/2/22  15:58
 */
@Service
public class RechargeService {
    @Autowired
    private RechargeDao rechargeDao;

    /**
     * @description 分页列出所有充值记录
     * @param pageBean
     * @author kuang
     * @date 2022/2/23
     */
    public PageBean<Recharge> listAll(PageBean<Recharge> pageBean){
        Sort sort = Sort.by(Sort.Direction.DESC, "id","createTime");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(), sort);
        Page<Recharge> findAll = rechargeDao.findAll(pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * @description 根据学生查找充值记录
     * @param student
     * @author kuang
     * @date 2022/2/22
     */
    public List<Recharge> listByStudent(Student student){
        return rechargeDao.findByStudent(student);
    }

    /**
     * @description 根据操作者查找充值记录
     * @param user
     * @author kuang
     * @date 2022/2/22
     */
    public List<Recharge> listByUser(User user){
        return rechargeDao.findByUser(user);
    }

    /**
     * @description 进行充值
     * @param recharge
     * @author kuang
     * @date 2022/2/22
     */
    public Recharge save(Recharge recharge){
        return rechargeDao.save(recharge);
    }

}
