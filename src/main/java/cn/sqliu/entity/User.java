package cn.sqliu.entity;

import java.sql.DataTruncation;
import java.util.Date;

public class User {

	private Integer id;

	private String uuid;

	private String username;
	
	private String password;

	private String phone;

	private String status;

	private Date createdTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", uuid='" + uuid + '\'' +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", phone='" + phone + '\'' +
				", status='" + status + '\'' +
				", createdTime=" + createdTime +
				'}';
	}
}
