package cn.sqliu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.sqliu.dao.IUserInfoDao;
import cn.sqliu.entity.UserInfo;
import cn.sqliu.service.IUserInfoService;

@Service
public class UserInfoService implements IUserInfoService {

	@Resource
	private IUserInfoDao userInfoDao;

	@Override
	public void insert(UserInfo userInfo) {
		userInfoDao.insert(userInfo);
	}

	@Override
	public void update(UserInfo userInfo) {
		userInfoDao.update(userInfo);
	}

	@Override
	public void deleteById(int id) {
		userInfoDao.deleteById(id);
	}

	@Override
	public UserInfo findById(int id) {

		return userInfoDao.findById(id);
	}

	@Override
	public List<UserInfo> find(UserInfo userInfo) {

		return userInfoDao.find(userInfo);
	}

	@Override
	public List<UserInfo> findAll() {

		return userInfoDao.findAll();
	}

}
