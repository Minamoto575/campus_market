package com.yuanlrc.campus_market.dao.common;

import com.yuanlrc.campus_market.entity.common.Goods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsDao extends JpaRepository<Goods, Long>,JpaSpecificationExecutor<Goods> {
	/**
	 * 根据id获取
	 * @return
	 */
	@Query("select g from Goods g where id = :id")
	Goods find(@Param("id")Long id);


	/**
	 * 根据图书分类查询图书列表
	 * @param cids
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	@Query(value="SELECT * from goods where goods_category_id IN :cids and `status` = 1 ORDER BY create_time desc,recommend desc limit :offset,:pageSize",nativeQuery=true)
	List<Goods> findList(@Param("cids")List<Long> cids,@Param("offset")Integer offset,@Param("pageSize")Integer pageSize);
	
	/**
	 * 获取根据分类搜索的总条数
	 * @param cids
	 * @return
	 */
	@Query(value="SELECT count(*) from goods where goods_category_id IN :cids and `status` = 1 ",nativeQuery=true)
	Long getTotalCount(@Param("cids")List<Long> cids);
	
	/**
	 * 获取指定状态的图书总数
	 * @param status
	 * @return
	 */
	@Query("SELECT count(g) from Goods g where g.status = :status ")
	Long getTotalCount(@Param("status")Integer status);
	
	/**
	 * 根据图书名称模糊搜索
	 * @param name
	 * @return
	 */
	@Query(value="select * from goods where name like %:name%",nativeQuery=true)
	List<Goods> findListByName(@Param("name")String name);
}
