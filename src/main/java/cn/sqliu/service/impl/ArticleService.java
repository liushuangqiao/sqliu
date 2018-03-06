package cn.sqliu.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.sqliu.dao.IArticleDao;
import cn.sqliu.entity.Article;
import cn.sqliu.service.IArticleService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

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
	public void updateArticle(Article article) {
		articleDao.updateArticle(article);
	}

	@Override
	public void changeStatusById(char status,Integer id) {
		articleDao.changeStatusById(status,id);
	}

	@Override
	public PageInfo<Article> findArticleList(char status,Integer currentPage) {
		currentPage = currentPage == null ? 1 : currentPage;
		PageHelper.startPage(currentPage, 10);
		List<Article> list = articleDao.findArticleList(status);
		PageInfo<Article> pageInfo = new PageInfo<Article>(list);
		return pageInfo;
	}

	@Override
	public PageInfo<Article> find(Article article,Integer currentPage) {
		currentPage = currentPage == null ? 1 : currentPage;
		PageHelper.startPage(currentPage, 10);
		List<Article> list = articleDao.find(article);
		PageInfo<Article> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public List<Article> searchList(char status,String searchInput, Integer currentPage) {
		/*currentPage = currentPage == null ? 1 : currentPage;
		PageHelper.startPage(currentPage, 10);*/
		List<Article> list = articleDao.findByTitle(searchInput);
		if(list.size()>0){
			/*System.out.println(list.toString());
			PageInfo<Article> pageInfo = new PageInfo<>(list);*/
			for(int i=0;i<list.size();i++){
				if(list.get(i).getTitle().contains(searchInput)){
					list.get(i).setTitle(list.get(i).getTitle().replaceAll(searchInput,"\\<font color='red'\\>"+searchInput+"</font>"));
				}
			}
			return list;
		}else{
			List<Article> list2 = articleDao.findByWords(searchInput);
			if(list2.size()>0){
				for(int i=0;i<list2.size();i++){
					if(list2.get(i).getWords().contains(searchInput)){
						int flag1 = list2.get(i).getWords().indexOf(searchInput);
						if(flag1 > 2){
							flag1 = flag1 - 2;
						}
						String w = list2.get(i).getWords().substring(flag1);
						list2.get(i).setWords("..."+w.replaceAll(searchInput,"\\<font color='red'\\>"+searchInput+"</font>"));
					}
				}
				return list2;
			}else{
				return new ArrayList<Article>();
			}
		}
	}
}
