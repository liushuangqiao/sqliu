package cn.sqliu.dao;

import cn.sqliu.entity.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by shuangqiao on 2016/9/10.
 */
public interface ICommentDao {
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
    List<Comment> findAll(@Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);

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
