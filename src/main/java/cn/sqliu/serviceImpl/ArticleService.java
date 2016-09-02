package cn.sqliu.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import cn.sqliu.dao.IArticleDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.sqliu.entity.Article;
import cn.sqliu.service.IArticleService;

@Service
public class ArticleService implements IArticleService{

	@Resource
	private IArticleDao articleDao;
	@Override
	public Article findById(int id){
		Article article = articleDao.findById(id);
		int add = article.getHits();
		add = add + 1;
		article.setId(id);
		article.setHits(add);
		articleDao.updateHitsById(id, add);
		return article;
	}
	
	@Override
	public List<Article> getNewArticle() {
		List<Article> list = articleDao.getNewArticle();
		return list;
	}

	@Override
	public PageInfo<Article> getAllArticle(Article article, Integer categoryId, Integer currentPage) {
		currentPage = currentPage == null ? 1 : currentPage;
		PageHelper.startPage(currentPage, 10);
		List<Article> list = articleDao.getAllArticle(article,categoryId);
		PageInfo<Article> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public Article getLastArticleById(Integer id, Integer categoryId) {
		return articleDao.getLastArticleById(id,categoryId);
	}

	@Override
	public Article getNextArticleById(Integer id, Integer categoryId) {
		return articleDao.getNextArticleById(id,categoryId);
	}

	/*
         * 根据点击排行获取文章列表
         */
	@Override
	public List<Article> getArticleByHits() {
		return articleDao.getArticleByHits();
	}

	@Override
	public void insertArticle(Article article) {
		 articleDao.insertArticle(article);
	}

	@Override
	public List<Article> updateArticle(Article article) {
		return articleDao.updateArticle(article);
	}

	@Override
	public List<Article> deleteArticleById(Integer id) {
		return articleDao.deleteArticleById(id);
	}

	@Override
	public List<Article> findArticleList() {
		return articleDao.findArticleList();
	}
}
