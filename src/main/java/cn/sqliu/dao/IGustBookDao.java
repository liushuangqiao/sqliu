package cn.sqliu.dao;

import java.util.List;

import cn.sqliu.entity.GustBook;

public interface IGustBookDao {
	/**
	 * 保存留言
	 * @param gustBook
     */
	void save(GustBook gustBook);

	/**
	 * 根据ID删除留言
	 * @param id
     */
	void deleteById(int id);

	/**
	 * 更新留言内容
	 * @param gustBook
     */
	void update(GustBook gustBook);

	/**
	 * 查询所有留言
	 * @return
     */
	List<GustBook> findAll();

	/**
	 * 根据ID查询一条留言记录
	 * @param id
	 * @return
     */
	GustBook findById(int id);

	/**
	 * 根据实体属性查询留言
	 * @param gustBook
	 * @return
     */
	List<GustBook> find(GustBook gustBook);

}
