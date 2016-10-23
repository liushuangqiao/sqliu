package cn.sqliu.daoTest;

import java.util.List;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.junit.Test;

import cn.sqliu.dao.IArticleDao;
import cn.sqliu.entity.Article;
import dev.xwolf.framework.web.test.SpringTestCase;

public class TestArticleDao extends SpringTestCase {

	@Resource
	private IArticleDao articleDao;
	
	@Test
	public void findTest(){
//		List<Article> list = new ArrayList<Article>();
//		Article article = new Article();
//		list=articleDao.getAllArticle(article,1,1);
//		System.out.println(list);
	}
	
	@Test
	public void findById(){
		Article article=articleDao.findById(5);
		System.out.println(article);
	}
	@Test
	public void insert(){
		Article article = new Article();
		article.setAuthor("我");
		article.setCategoryId(2);
		article.setTitle("中文");
		article.setWords("中文");
		articleDao.insertArticle(article);
	}

	@Test
	public void last(){
		Article last = articleDao.getLastArticleById(52,4);
		System.out.println(last.toString());
		Article next = articleDao.getNextArticleById(52,4);
		System.out.println(next.toString());
	}

	@Test
	public void find(){
		Article article = new Article();
		article.setStatus('0');
		List<Article> list = articleDao.find(article);
		System.out.println(list);
	}

}
