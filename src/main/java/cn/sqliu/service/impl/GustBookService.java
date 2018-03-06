package cn.sqliu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import cn.sqliu.dao.IForbiddenWordsDao;
import cn.sqliu.entity.ForbiddenWords;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.sqliu.dao.IGustBookDao;
import cn.sqliu.entity.GustBook;
import cn.sqliu.service.IGustBookService;
import cn.sqliu.util.Constants;

@Service
public class GustBookService implements IGustBookService {
	
	@Resource
	private IGustBookDao gustBookDao;
	@Resource
	private IForbiddenWordsDao forbiddenWordsDao;

	@Override
	public void save(GustBook gustBook) {
		List<ForbiddenWords> forbiddenWordsList = forbiddenWordsDao.find();
		String contents = gustBook.getContents();
		for(ForbiddenWords forbiddenWords:forbiddenWordsList){
			if(contents.contains(forbiddenWords.getWords())){
				contents = contents.replace(forbiddenWords.getWords(),Constants.Asterisk);
			}
		}
		gustBook.setContents(contents);
		gustBookDao.save(gustBook);
	}

	@Override
	public void deleteById(int id) {
		gustBookDao.deleteById(id);

	}

	@Override
	public void update(GustBook gustBook) {
		gustBookDao.update(gustBook);
		
	}

	@Override
	public PageInfo<GustBook> findAll(Integer currentPage) {
		currentPage = currentPage == null ? 1 : currentPage;
        PageHelper.startPage(currentPage, 10);
		List<GustBook> list = gustBookDao.findAll();
		PageInfo<GustBook> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public GustBook findById(int id) {
		return gustBookDao.findById(id);
	}

	@Override
	public List<GustBook> find(GustBook gustBook) {
		List<GustBook> list = gustBookDao.find(gustBook);
		return list;
	}

}
