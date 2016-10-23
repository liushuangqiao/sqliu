package cn.sqliu.entity;

import java.util.Date;

/**
 * Created by shuangqiao on 2016/9/10.
 */
public class Comment {
    /**
     * 自增长id
     */
    private Integer id;
    /**
     * 所属文章id
     */
    private Integer essayId;

    /**
     * 所属用户id
     */
    private Integer userId;

    /**
     * 用户名，数据表无此字段
     */
    private String userName;

    /**
     * 评论内容
     */
    private String words;

    /**
     * 评论点赞数
     */
    private Integer praise;

    /**
     * 该条评论的状态
     */
    private String status;

    /**
     * 发表时间
     */
    private Date createdTime;

    /**
     * 修改时间
     */
    private Date updatedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEssayId() {
        return essayId;
    }

    public void setEssayId(Integer essayId) {
        this.essayId = essayId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }

    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", essayId=" + essayId +
                ", userId=" + userId +
                ", userName=" + userName +
                ", words='" + words + '\'' +
                ", praise=" + praise +
                ", status='" + status + '\'' +
                ", createdTime=" + createdTime +
                ", updatedTime=" + updatedTime +
                '}';
    }
}
