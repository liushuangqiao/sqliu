package cn.sqliu.service;

import cn.sqliu.entity.FriendUrl;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by shuangqiao on 2016/11/18.
 */
public interface IFriendUrlService {
    void save(FriendUrl friendUrl);

    void update(FriendUrl friendUrl);

    PageInfo<FriendUrl> findList(Integer currentPage);

    FriendUrl findById(int id);

    List<FriendUrl> find(FriendUrl friendUrl);

    void deleteById(int id);

    Integer count();
}
