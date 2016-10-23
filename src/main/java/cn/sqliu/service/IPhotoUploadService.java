package cn.sqliu.service;

import org.springframework.web.multipart.MultipartFile;

public interface IPhotoUploadService {

	public void photoUpload(MultipartFile file);
}
