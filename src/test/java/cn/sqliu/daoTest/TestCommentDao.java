package cn.sqliu.daoTest;

import cn.sqliu.dao.ICommentDao;
import cn.sqliu.entity.Comment;
import dev.xwolf.framework.web.test.SpringTestCase;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by shuangqiao on 2016/9/10.
 */
public class TestCommentDao  extends SpringTestCase {
    @Resource
    private ICommentDao commentDao;

    @Test
    public void testSave(){
        Comment comment = new Comment();
        comment.setEssayId(54);
        comment.setPraise(0);
        comment.setUserId(1);
        comment.setStatus("1");
        comment.setWords("很精彩！");
        commentDao.save(comment);
    }

    @Test
    public void findAll(){
        List<Comment> list = commentDao.findAll(1,1);
        System.out.println(list);
    }

    @Test
    public void find(){
        Comment comment = new Comment();
        comment.setEssayId(54);
        List<Comment> list = commentDao.find(comment);
        System.out.println(list);
    }
}
