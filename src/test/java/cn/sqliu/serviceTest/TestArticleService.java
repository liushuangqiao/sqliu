package cn.sqliu.serviceTest;

import java.util.ArrayList;

import javax.annotation.Resource;

import com.github.pagehelper.PageInfo;
import org.junit.Test;

import cn.sqliu.entity.Article;
import cn.sqliu.service.IArticleService;
import dev.xwolf.framework.web.test.SpringTestCase;

import java.util.List;

public class TestArticleService extends SpringTestCase {

	@Resource
	private IArticleService articleService;
	
	@Test
	public void findTest(){
		Article article = new Article();
		PageInfo<Article> list =articleService.getAllArticle(article,1,1);
		System.out.println(list);
	}
	
	@Test
	public void findById(){
		Article article=articleService.findById(5);
		System.out.println(article);
	}

	@Test
	public void last(){
		Article last = articleService.getLastArticleById(52,4);
		System.out.println(last.toString());
		Article next = articleService.getNextArticleById(52,4);
		System.out.println(next.toString());
	}

}
