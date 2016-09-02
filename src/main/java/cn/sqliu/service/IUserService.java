package cn.sqliu.service;

import cn.sqliu.entity.User;

import java.util.List;

/**
 * Created by shuangqiao on 2016/7/31.
 */
public interface IUserService {
    void insert(User user);
    void update(User user);
    User findById(Integer userId);
    void deleteById(Integer userId);
    List<User> findByUser(User user);
    User findByName(String username);
}
