package cn.sqliu.service.impl;

import cn.sqliu.dao.IUserDao;
import cn.sqliu.entity.User;
import cn.sqliu.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService implements IUserService{

    @Resource
    private IUserDao userDao;
    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public User findById(Integer userId) {
        return userDao.findById(userId);
    }

    @Override
    public void deleteById(Integer userId) {
        userDao.deleteById(userId);
    }

    @Override
    public List<User> findByUser(User user) {
        return userDao.findByUser(user);
    }

    @Override
    public User findByName(String username) {
        return userDao.findByName(username);
    }

    @Override
    public PageInfo<User> userList(Integer currentPage) {
        currentPage = currentPage == null ? 1 : currentPage;
        PageHelper.startPage(currentPage, 10);
        List<User> list = userDao.userList();
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
