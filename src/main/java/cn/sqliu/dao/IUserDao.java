package cn.sqliu.dao;

import cn.sqliu.entity.User;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by shuangqiao on 2016/7/31.
 */
public interface IUserDao {

    void insert(User user);
    void update(User user);
    User findById(Integer userId);
    void deleteById(Integer userId);
    List<User> findByUser(User user);
    User findByName(String username);
}
