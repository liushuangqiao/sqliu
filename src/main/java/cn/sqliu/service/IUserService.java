package cn.sqliu.service;

import cn.sqliu.entity.User;
import com.github.pagehelper.PageInfo;

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
    PageInfo<User> userList(Integer currentPage);
    User findByName(String username);
}
