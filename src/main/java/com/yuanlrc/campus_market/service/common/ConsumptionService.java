package com.yuanlrc.campus_market.service.common;

import com.yuanlrc.campus_market.dao.common.ConsumptionDao;
import com.yuanlrc.campus_market.entity.common.Consumption;
import com.yuanlrc.campus_market.entity.common.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kuang
 * @description
 * @date 2022/2/22  15:58
 */
@Service
public class ConsumptionService {

    @Autowired
    public ConsumptionDao consumptionDao;

    /**
     * @description 查找所有消费记录
     * @author kuang
     * @date 2022/2/22
     */
    public List<Consumption> listAll(){
        return consumptionDao.findAll();
    }

    /**
     * @description 根据学生查询消费记录
     * @param student
     * @author kuang
     * @date 2022/2/22
     */
    public List<Consumption> listByStudent(Student student){
        return consumptionDao.findByStudent(student);
    }

    /**
     * @description 进行消费
     * @param consumption
     * @author kuang
     * @date 2022/2/22
     */
    public Consumption save(Consumption consumption){
        return consumptionDao.save(consumption);
    }


}
