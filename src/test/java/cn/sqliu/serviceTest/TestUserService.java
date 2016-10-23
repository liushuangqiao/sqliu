package cn.sqliu.serviceTest;

import cn.sqliu.entity.User;
import cn.sqliu.service.impl.UserService;
import dev.xwolf.framework.web.test.SpringTestCase;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * Created by shuangqiao on 2016/10/13.
 */
public class TestUserService extends SpringTestCase {
    @Resource
    private UserService userService;

    @Test
    public void testUser(){
        String username = "admin";
        String password = "12345";
        User user = new User();
        try {
            user = userService.findByName(username);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(user!=null){
            user.setId(user.getId());
            user.setPassword(password);
            userService.update(user);
            System.out.println("yes");
        }else{
            System.out.println("no");
        }
    }
}
