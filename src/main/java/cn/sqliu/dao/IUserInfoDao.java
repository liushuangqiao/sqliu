package cn.sqliu.dao;

import java.util.List;

import cn.sqliu.entity.UserInfo;

/**
 * Created by shuangqiao on 2017/3/18.
 * 用户信息Dao接口
 */
public interface IUserInfoDao {

	/**
	 * 保存用户信息
	 * @param userInfo
	 */
	void insert(UserInfo userInfo);
	/**
	 * 更新用户信息
	 * @param userInfo
	 */
	void update(UserInfo userInfo);
	/**
	 * 根据ID删除用户信息
	 * @param id
	 */
	void deleteById(int id);
	/**
	 * 根据ID查询用户信息
	 * @param id
	 * @return
	 */
	UserInfo findById(int id);
	/**
	 * 根据属性查询用户信息
	 * @param userInfo
	 * @return
	 */
	List<UserInfo> find(UserInfo userInfo);
	/**
	 * 查询所有用户信息
	 * @return
	 */
	List<UserInfo> findAll();
}
