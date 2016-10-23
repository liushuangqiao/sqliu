package cn.sqliu.service.impl;

import cn.sqliu.dao.ICommentDao;
import cn.sqliu.entity.Comment;
import cn.sqliu.service.ICommentService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.annotation.Resources;
import java.util.List;

/**
 * Created by shuangqiao on 2016/9/10.
 */
@Service
public class CommentService implements ICommentService{
    @Resource
    private ICommentDao commentDao;
    @Override
    public void save(Comment comment) {
        commentDao.save(comment);
    }

    @Override
    public void deleteById(Integer id) {
        commentDao.deleteById(id);
    }

    @Override
    public void update(Comment comment) {
        commentDao.update(comment);
    }

    @Override
    public PageInfo<Comment> findAll(Integer currentPage, Integer pageSize) {
        List<Comment> list = commentDao.findAll(currentPage,pageSize);
        PageInfo<Comment> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Comment findById(Integer id) {
        return commentDao.findById(id);
    }

    @Override
    public List<Comment> find(Comment comment) {
        return commentDao.find(comment);
    }

}
