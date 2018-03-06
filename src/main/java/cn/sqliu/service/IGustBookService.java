package cn.sqliu.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.sqliu.entity.GustBook;

public interface IGustBookService {
	
	void save(GustBook gustBook);
	
	void deleteById(int id);
	
	void update(GustBook gustBook);
	
	PageInfo<GustBook> findAll(Integer currentPage);
	
	GustBook findById(int id);
	
	List<GustBook> find(GustBook gustBook);

}
