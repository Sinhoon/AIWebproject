package com.example.demo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import javax.imageio.ImageIO;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "sendView";
	}

	@RequestMapping(value = "/upload.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String fileUpload(MultipartHttpServletRequest multipartRequest, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String id = "0";
		String age = multipartRequest.getParameter("age");
		String sex = multipartRequest.getParameter("sex");
		String filePath = "C://mywork/spring/demo/src/main/resources/static/data/user";

		HandlerFile handlerFile = new HandlerFile(multipartRequest, filePath);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		Date time = new Date();
		String nowdate = format1.format(time);
		handlerFile.getUploadFileName(id, nowdate);
		String fileName = handlerFile.getFileFullPath();

		Client client = new Client("0",fileName, id, age, sex);
		JsonObject result = client.getResult();

		String afimg = result.get("imgpath").toString().replaceAll("\"", "");
		String ogimg = (afimg.substring(0, afimg.lastIndexOf("_")) + "_bf.jpg").replaceAll("\"", "");
		String data = result.get("data").toString();
		String score = result.get("score").toString();

		JsonObject jo = new JsonObject();
		jo.addProperty("afimg", afimg);
		jo.addProperty("ogimg", ogimg);
		jo.addProperty("data", data);
		jo.addProperty("score", score);

		return jo.toString();

	}
	
	@RequestMapping(value = "/recom.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String recom(MultipartHttpServletRequest multipartRequest, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String clothlist = multipartRequest.getParameter("recominput");
		String age = multipartRequest.getParameter("age");
		String sex = multipartRequest.getParameter("sex");
		String fileName = "C://mywork/spring/demo/src/main/resources/static/" + multipartRequest.getParameter("filename");

		Client client = new Client("1",fileName, clothlist, age, sex);
		JsonObject result = client.getResult();
	
		JsonObject jo = new JsonObject();
		String recomdata = result.get("recomdata").toString();
		jo.addProperty("recomdata", recomdata );

		System.out.println(clothlist);
		return jo.toString();

	}
}
