package cn.sqliu.dao;

import cn.sqliu.entity.FriendUrl;

import java.util.List;

/**
 * Created by shuangqiao on 2016/11/18.
 */
public interface IFriendUrlDao {
    /**
     * 保存友情链接
     * @param friendUrl
     */
    void save(FriendUrl friendUrl);

    /**
     * 修改更新友情链接内容
     * @param friendUrl
     */
    void update(FriendUrl friendUrl);

    /**
     * 查询所有友情链接
     * @return
     */
    List<FriendUrl> findList();

    /**
     * 根据ID查询一条友情链接的记录
     * @param id
     * @return
     */
    FriendUrl findById(int id);

    /**
     * 根据实体属性查询友情链接
     * @param friendUrl
     * @return
     */
    List<FriendUrl> find(FriendUrl friendUrl);

    /**
     * 根据ID删除一条记录
     * @param id
     */
    void deleteById(int id);

    /**
     * 查询友情链接总数
     * @return
     */
    Integer count();
}
