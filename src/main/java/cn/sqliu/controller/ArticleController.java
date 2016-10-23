package cn.sqliu.controller;

import java.util.Iterator;
import java.util.List;

import cn.sqliu.entity.Article;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import cn.sqliu.entity.Comment;
import cn.sqliu.service.ICommentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.sqliu.service.IArticleService;
import cn.sqliu.service.IPhotoUploadService;
import cn.sqliu.util.PageUtil;

@Controller
@RequestMapping("/")
public class ArticleController {

	@Resource
	private IArticleService iarticleService;
	@Resource
	private ICommentService commentService;

	@Resource
	private IPhotoUploadService photoUploadService;
	
	@RequestMapping("/")
	public String getArticle(Model model){
		List<Article> list = iarticleService.getNewArticle();
		model.addAttribute("pageInfo", list);
		List<Article> articleRight = iarticleService.getArticleByHits();
		model.addAttribute("articleRight", articleRight);
		return "/index";
	}

	@RequestMapping("/essay/{categoryId}/{currentPage}")
	public String essay(Model model,Article article,@PathVariable("currentPage")Integer currentPage,@PathVariable("categoryId")Integer categoryId){
		 currentPage = PageUtil.getCurrentPage(currentPage);
		PageHelper.startPage(currentPage, PageUtil.getPageSize());
		PageInfo<Article> pageInfo = iarticleService.getAllArticle(article,categoryId,currentPage);
		model.addAttribute("pageInfo", pageInfo);
		List<Article> newlist = iarticleService.getNewArticle();
		model.addAttribute("newlist", newlist);
		List<Article> articleRight = iarticleService.getArticleByHits();
		model.addAttribute("articleRight", articleRight);
		return "/essay";
	}
	
	//文章详情页
	@RequestMapping("/essayDetail/{id}")
	public String essayDetail(Model model,@PathVariable("id") Integer id){
		Article article = iarticleService.findById(id);
		model.addAttribute("article", article);
		List<Article> newlist = iarticleService.getNewArticle();
		model.addAttribute("newlist", newlist);
		List<Article> articleRight = iarticleService.getArticleByHits();
		model.addAttribute("articleRight", articleRight);

		int categoryId = article.getCategoryId();
		//获得上一篇和下一篇
		Article lastInfo = iarticleService.getLastArticleById(id,categoryId);
		model.addAttribute("lastTitle",lastInfo);
		Article nextInfo = iarticleService.getNextArticleById(id,categoryId);
		model.addAttribute("nextTitle",nextInfo);
		Comment comment = new Comment();
		comment.setEssayId(id);
		List<Comment> commentList = commentService.find(comment);
		model.addAttribute("commentList",commentList);
		return "/essayDetail";
	}
	
	//根据点击排行获取文章列表
	
	
	@RequestMapping("/photo")
	public ModelAndView photo(ModelAndView modelAndView){
		List<Article> articleRight = iarticleService.getArticleByHits();
		modelAndView.addObject("articleRight", articleRight);
		modelAndView.setViewName("/photo");
		return modelAndView;
	}
	
	@RequestMapping("/photoDetail")
	public ModelAndView photoDetail(ModelAndView modelAndView){
		modelAndView.setViewName("/photoDetail");
		return modelAndView;
	}
	
	//处理图片上传
	@RequestMapping("/photoUpload")
	public ModelAndView photoUpload(ModelAndView modelAndView,HttpServletRequest request){
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		// 检查form是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 由CommonsMultipartFile继承而来,拥有上面的方法.
				MultipartFile file = multiRequest.getFile(iter.next());
				photoUploadService.photoUpload(file);
			}
		}
		modelAndView.setViewName("/photo");
		return modelAndView;
	}

	@RequestMapping("/msg/{currentPage}")
	public ModelAndView msg(ModelAndView modelAndView,Integer currentPage){
		 currentPage = PageUtil.getCurrentPage(currentPage);
	        PageHelper.startPage(1, 20);
		modelAndView.setViewName("/msg");
		return modelAndView;
	}
}
