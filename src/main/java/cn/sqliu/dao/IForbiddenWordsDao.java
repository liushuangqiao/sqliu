package cn.sqliu.dao;

import cn.sqliu.entity.ForbiddenWords;

import java.util.List;

/**
 * Created by shuangqiao on 2016/12/24.
 */
public interface IForbiddenWordsDao {
    List<ForbiddenWords> find();
}
