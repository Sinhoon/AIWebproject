package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class HandlerFile {
	   
	  private MultipartHttpServletRequest multipartRequest;
	  private String filePath;
	  private Map<String, List<String>> fileNames;
	  private String oldName;
	  private HttpServletResponse resp;
	  private byte[] fileByte;
	  
	  String fileFullPath;
	   
	  // upload
	  public HandlerFile(MultipartHttpServletRequest multipartRequest, String filePath) {
	    this.multipartRequest = multipartRequest;
	    this.filePath = filePath;
	    fileNames = new HashMap<String, List<String>>();
	  }
	  // down
	  public HandlerFile(HttpServletResponse resp, String filePath, String saveName, String oldName) {
	    this.resp = resp;
	    this.filePath = filePath + "/" + saveName;
	    this.oldName = oldName;
	  }
	  // delete
	  public HandlerFile(String filePath, String saveName) {
	    this.filePath = filePath + "/" + saveName;
	  }
	   
	  // upload
	  public void getUploadFileName(String id , String nowdate) {
	    upload(id, nowdate);
	  }
	  // down
	  public byte[] getDownloadFileByte() {
	    dowonload();
	    return fileByte;
	  }
	  // delete
	  public void deleteFileExecute() {
	    File file = new File(filePath);
	    if(file.exists()) {
	      file.delete();
	    }
	  }
	  
	  public String getFileFullPath() {
		  return fileFullPath;
	  }
	   
	  // �뙆�씪 �뾽濡쒕�? 泥섎?��
	  private void upload(String id , String nowdate) {
	    Iterator<String> itr = multipartRequest.getFileNames();
	    StringBuffer sb = null;
	    while (itr.hasNext()) { // 諛쏆�? �뙆�씪�뱾�쓣 紐⑤�? �룎?��곕떎.
	      MultipartFile mpf = multipartRequest.getFile(itr.next());
	      sb = new StringBuffer();

	      fileFullPath = filePath + "/" + id +"_" + nowdate + ".jpg"; // �뙆�씪 �쟾泥� 寃쎈�?
	      try {
	        // �뙆�씪 ���옣
	        mpf.transferTo(new File(fileFullPath));

	      } catch (Exception e) {
	        e.printStackTrace();
	      }
	    }

	  }
	  // down
	  private void dowonload() {
	    try {
	      fileByte = FileUtils.readFileToByteArray(new File(filePath));
	      resp.setContentType("application/octet-stream");
	      resp.setContentLength(fileByte.length);
	      // �떎�슫濡쒕뱶�?�� 蹂�寃�?�? �뙆�씪紐�
	      resp.setHeader("Content-Disposition", "attachment; fileName=\""
	                                                           + URLEncoder.encode(oldName, "UTF-8") + "\";");
	      resp.setHeader("Content-Transfer-Encoding", "binary");
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	  }
	}
