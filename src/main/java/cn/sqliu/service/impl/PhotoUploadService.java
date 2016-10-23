package cn.sqliu.service.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.sqliu.service.IPhotoUploadService;
import cn.sqliu.util.PhotoConstant;
import dev.xwolf.framework.config.properties.Property;

@Service
public class PhotoUploadService implements IPhotoUploadService{

	@Override
	public void photoUpload(MultipartFile file) {
		if(file != null){
			String docSavePath = Property.getProperty(PhotoConstant.PHOTO_SAVE_PATH);
			String folderPath = docSavePath + File.separator;
			File folder = new File(folderPath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			
			String path = folderPath + File.separator;
			String name = file.getOriginalFilename();
			File localFile = new File(path+name);
			try {
				file.transferTo(localFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
