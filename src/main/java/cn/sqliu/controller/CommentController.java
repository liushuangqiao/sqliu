package cn.sqliu.controller;

import cn.sqliu.entity.Comment;
import cn.sqliu.entity.User;
import cn.sqliu.service.ICommentService;
import cn.sqliu.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by shuangqiao on 2016/9/11.
 */
@Controller
@RequestMapping("comment")
public class CommentController {
    @Resource
    private ICommentService commentService;
    @Resource
    private IUserService userService;
    @RequestMapping("/addPraise")
    @ResponseBody
    public String addPraise(Comment comment){
        int praise = comment.getPraise();
        praise = praise + 1;
        comment.setPraise(praise);
        commentService.update(comment);
        return "1";
    }

    @RequestMapping("save")
    @ResponseBody
    public String save(Comment comment,String username){
        User user = userService.findByName(username);
        if(user!=null){
            String words = comment.getWords().replaceAll(" ","").trim();
            if(words!=""&&words!=null) {
                int userId = user.getId();
                comment.setUserId(userId);
                comment.setStatus("1");
                comment.setPraise(0);
                commentService.save(comment);
                return "1";
            }else{
                return "2";
            }
        }else{
            return "0";
        }
    }
}
