package cn.sqliu.controller;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sqliu.entity.Article;
import cn.sqliu.entity.User;

import cn.sqliu.service.IArticleService;
import cn.sqliu.service.IUserService;
import cn.sqliu.util.ImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * Created by shuangqiao on 2016/9/3.
 */
@Controller
public class LoginController {
    @Resource
    private IArticleService iarticleService;
    @Resource
    private IUserService userService;
    @RequestMapping("/to_login")
    public String tologin(Model model){
        Random rand = new Random();
        int randNum = rand.nextInt(5);
        model.addAttribute("randNum",randNum);
        return "/user/user_login";
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public String login(String username) {
        User user = new User();
        try {
            user = userService.findByName(username);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(user!=null) {
            return "1";
        }else{
            return "0";
        }
    }

    @RequestMapping("login")
    @ResponseBody
    public String loginChk(String username,String password, HttpSession session,Model model){
        User user = new User();
        try {
            user = userService.findByName(username);
        }catch (Exception e){
            e.printStackTrace();
        }
        String pwd = user.getPassword();
        if(password.equals(pwd)) {
            session.setAttribute("username", username);
            List<Article> list = iarticleService.getNewArticle();
            model.addAttribute("pageInfo", list);
            List<Article> articleRight = iarticleService.getArticleByHits();
            model.addAttribute("articleRight", articleRight);
            return "1";
        }else{
            return "0";
        }
    }

    @RequestMapping("register")
    @ResponseBody
    public String registerCheck(String username, String password,String phone, HttpSession session) {
        User user = new User();
        try {
            user = userService.findByName(username);
        }catch (Exception e){
            e.printStackTrace();
        }
        if (user!=null) {
            return "0";
        } else {
            User user2 = new User();
            user2.setUsername(username);
            user2.setPassword(password);
            user2.setPhone(phone);
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            user2.setUuid(uuid);
            user2.setStatus("1");
            userService.insert(user2);
            session.setAttribute("username", username);
            return "1";
        }
    }

    @RequestMapping("forgetPwd")
    public String forgetPwd(Model model){
        Random rand = new Random();
        int randNum = rand.nextInt(5);
        model.addAttribute("randNum",randNum);
        return "user/forget_password";
    }

    @RequestMapping("imgCode")
    public void getImgCode(HttpServletResponse response,HttpSession session)throws IOException{
        //利用图片工具生成图片
        //第一个参数是生成的验证码，第二个参数是生成的图片
        Object[] objs = ImageUtil.createImage();
       //将验证码存入Session
        session.setAttribute("imageCode",objs[0]);
        //将图片输出给浏览器
        BufferedImage image = (BufferedImage) objs[1];
        response.setContentType("image/png");
        OutputStream os = response.getOutputStream();
        ImageIO.write(image, "png", os);
    }

    //检查验证码是否正确
    @RequestMapping("codeCheck")
    @ResponseBody
    public String getSession(HttpSession session,String code){
        Object obj = session.getAttribute("imageCode");
        if(code.equals(obj.toString())){
            return "1";
        }else{
            return "0";
        }
    }

    @RequestMapping("forgetCheck")
    @ResponseBody
    public String checkNameAndPhone(String username,String phone){
        User user = new User();
        try {
            user = userService.findByName(username);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(user!=null) {
            String telephone = user.getPhone();
            if(phone.equals(telephone)){
                return "1";
            }else {
                return "2";
            }
        }else{
            return "0";
        }
    }

    @RequestMapping("passwordReset")
    public String pwdReset(Model model){
        Random rand = new Random();
        int randNum = rand.nextInt(5);
        model.addAttribute("randNum",randNum);
        return "user/password_reset";
    }

    @RequestMapping("resetPassword")
    @ResponseBody
    public String resetPassword(String username,String password){
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
            return "1";
        }else{
            return "0";
        }
    }
}
