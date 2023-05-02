package org.studywithme.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	
	@GetMapping("/uploadAjax") 
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@PostMapping("/uploadAjaxAction")
	 public void uploadAjaxPost(MultipartFile[] uploadFile) {
	
		 log.info("update ajax post.........");
		
		 String uploadFolder = "C:\\upload";
	 
		//make folder
		 	File uploadPath = new File(uploadFolder, getFolder());
			if(uploadPath.exists()==false) {
				uploadPath.mkdirs();
			}
		 
	
		 for (MultipartFile multipartFile : uploadFile) {
		
			 log.info("-------------------------------------");
			 log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			 log.info("Upload File Size: " + multipartFile.getSize());
			
			 String uploadFileName = multipartFile.getOriginalFilename();
			
			 // IE has file path
			 uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			 
			 UUID uuid = UUID.randomUUID();
			 uploadFileName = uuid.toString() + "_" + uploadFileName;
			 
			 log.info("only file name: " + uploadFileName);
			
			 // File saveFile = new File(uploadFolder, uploadFileName);
			 try {
				 File saveFile = new File(uploadPath, uploadFileName);
				 multipartFile.transferTo(saveFile);
				 
				 if(checkImageType(saveFile)) {
						FileOutputStream thumbnail = new FileOutputStream(
								new File(uploadPath, "s_" + uploadFileName));
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), 
								thumbnail, 100, 100);
						thumbnail.close();
					 
				 }
			 } catch (Exception e) {
				 log.error(e.getMessage());
			 } // end catch
		
		 } // end for
	
	 }
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
		 Date date = new Date();
		 String str = sdf.format(date);
			
		 return str.replace("-", File.separator);
	 }
		
	 private boolean checkImageType(File file) {

		 try {
			 String contentType = Files.probeContentType(file.toPath());

			 return contentType.startsWith("image");
		 } catch (IOException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		 }
		 return false;
	 }
}
