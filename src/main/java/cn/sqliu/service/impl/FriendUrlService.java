package cn.sqliu.service.impl;

import cn.sqliu.dao.IFriendUrlDao;
import cn.sqliu.entity.FriendUrl;
import cn.sqliu.service.IFriendUrlService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by shuangqiao on 2016/11/18.
 */
@Service
public class FriendUrlService implements IFriendUrlService{
    @Resource
    private IFriendUrlDao friendUrlDao;
    @Override
    public void save(FriendUrl friendUrl) {
        friendUrlDao.save(friendUrl);
    }

    @Override
    public void update(FriendUrl friendUrl) {
        friendUrlDao.update(friendUrl);
    }

    @Override
    public PageInfo<FriendUrl> findList(Integer currentPage) {
        currentPage = currentPage == null ? 1 : currentPage;
        PageHelper.startPage(currentPage, 10);
        List<FriendUrl> list = friendUrlDao.findList();
        PageInfo<FriendUrl> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public FriendUrl findById(int id) {
        return friendUrlDao.findById(id);
    }

    @Override
    public List<FriendUrl> find(FriendUrl friendUrl) {
        return friendUrlDao.find(friendUrl);
    }

    @Override
    public void deleteById(int id) {
        friendUrlDao.deleteById(id);
    }

    @Override
    public Integer count() {
        return friendUrlDao.count();
    }
}
