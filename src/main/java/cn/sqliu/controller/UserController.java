package cn.sqliu.controller;

import cn.sqliu.entity.User;
import cn.sqliu.service.IUserService;
import dev.xwolf.framework.security.core.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by shuangqiao on 2016/7/31.
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private IUserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request, Model model,
                        String code, HttpServletResponse response,String username, String password){
        response.setContentType("text/html; charset=utf-8");
        User user =  userService.findByName(username);
        if(user!=null){
            if (user.getStatus() == "1") {
                request.getSession().setAttribute("user",user);
            }
        }
        return "redirect:/";
    }
    @RequestMapping("loginCheck")
    public String loginChk(String username,String password){
        return "";
    }

}
