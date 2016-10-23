package cn.sqliu.service;

import cn.sqliu.entity.Comment;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by shuangqiao on 2016/9/10.
 */
public interface ICommentService {
    /**
     * 保存评论信息
     * @param comment
     */
    void save(Comment comment);

    /**
     * 根据id删除评论
     * @param id
     */
    void deleteById(@Param("id")Integer id);

    /**
     * 修改评论
     * @param comment
     */
    void update(Comment comment);

    /**
     * 查询所有评论
     * @param currentPage
     * @param pageSize
     * @return
     */
    PageInfo<Comment> findAll(@Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);

    /**
     * 根据id查询一条评论
     * @param id
     * @return
     */
    Comment findById(@Param("id")Integer id);

    /**
     * 根据内容查询
     * @param comment
     * @return
     */
    List<Comment> find(Comment comment);
}
