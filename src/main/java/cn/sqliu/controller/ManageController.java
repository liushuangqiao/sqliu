package cn.sqliu.controller;

import cn.sqliu.entity.Article;
import cn.sqliu.service.IArticleService;
import cn.sqliu.service.IPhotoUploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("manage")
public class ManageController {
    @Resource
    private IArticleService articleService;
    @Resource
    private IPhotoUploadService photoUploadService;

    /**
     * 响应后台写文章表单的请求.
     * @return
     */
    @RequestMapping("list")
    public String manage(){
        return "manage/panels";
    }
    /**
     * 响应后台写文章表单的请求.
     * @return
     */
    @RequestMapping("/write")
    public String write(){
        return "manage/write";
    }

    @RequestMapping(value = "/writeAdd", method = RequestMethod.POST)
    @ResponseBody
    public String writeAdd(Article article){
        articleService.insertArticle(article);
        return "redirect:/manage/list";
    }

    @RequestMapping("/updateArticle/{id}")
    public String update(Model model,@PathVariable("id") Integer id){
        Article article = articleService.findById(id);
        model.addAttribute("article", article);
        return "/manage/updateArticle";
    }

    @RequestMapping("/articleList")
    public String articleList(Model model){
        List<Article> alist =  articleService.findArticleList();
        model.addAttribute("list", alist);
        return "manage/articleList";
    }
}

