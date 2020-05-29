package com.example.demo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import javax.imageio.ImageIO;

@MapperScan(basePackages="com.example.demo")
@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist() {
		return "regist";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/sendView", method = RequestMethod.GET)
	public String sendView() {
		return "sendView";
	}
	
	@RequestMapping(value = "/like", method = RequestMethod.GET)
	public String like() {
		return "like";
	}
	
	@RequestMapping(value = "/userlike", method = RequestMethod.GET)
	public String userlike() {
		return "userlike";
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

		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("member");

		String id = Integer.toString(user.EMP_NUM);
		System.out.println(id);
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
		
		String clothlist = "";
		String mode = multipartRequest.getParameter("recominput");
		System.out.println(mode);
		if (mode.equals("0")) {
			clothlist =  multipartRequest.getParameter("recominput_upper");
		}else if (mode.equals("1")) {
			clothlist =  multipartRequest.getParameter("recominput_lower");
		}else if (mode.equals("2")) {
			clothlist =  multipartRequest.getParameter("recominput_outer");
		}else {
			clothlist =  multipartRequest.getParameter("recominput_full");
		}
			
		String age = multipartRequest.getParameter("age");
		String sex = multipartRequest.getParameter("sex");
		String fileName = "C://mywork/spring/demo/src/main/resources/static/" + multipartRequest.getParameter("filename");

		Client client = new Client("1",fileName, clothlist, age, sex);
		JsonObject result = client.getResult();
		String recom = result.get("list").toString();
		
		/*
		 * JsonParser parser = new JsonParser(); JsonElement tradeElement =
		 * parser.parse(recom); JsonArray trade = tradeElement.getAsJsonArray();
		 * System.out.println(trade.get(0)); System.out.println(trade.size());
		 */
		
		return recom;

	}
	
	@RequestMapping(value = "/like.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String like(MultipartHttpServletRequest multipartRequest, HttpServletRequest request,
			HttpServletResponse response, Model model, RedirectAttributes rttr) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("member");

		int id = user.EMP_NUM;
		// 취소 1 좋아요 0
		String mode = multipartRequest.getParameter("likemode");
		String likeurl = multipartRequest.getParameter("likeinput");
		String likeupper = multipartRequest.getParameter("likeupper");
		String likelower = multipartRequest.getParameter("likelower");
		String likefull = multipartRequest.getParameter("likefull");
		String likeouter = multipartRequest.getParameter("likeouter");
		if (likelower.equals("")) {
			likelower = "not";
		}
		if (likeupper.equals("")) {
			likeupper = "not";
		}
		if (likefull.equals("")) {
			likefull = "not";
		}
		if (likeouter.equals("")) {
			likeouter = "not";
		}
		String likeall =  likeupper +","+ likelower +","+ likefull +","+ likeouter ;
		System.out.println(likeall);
		int num = userMapper.likecountNum() + 1;
		LikeDTO like = new LikeDTO(num,likeurl,likeall,id);
		if(mode.equals("1")) {
			if (userMapper.checkLike(like) == 0) {
			userMapper.insertLike(like);
			}
		}else {
			userMapper.deleteLike(like);
		}
		return "success";

	}
	
	
    @Autowired
    UserMapper userMapper;
    
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public RedirectView regist(MultipartHttpServletRequest multipartRequest, HttpServletRequest request,RedirectAttributes rttr,
			HttpServletResponse response, Model model) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String id = multipartRequest.getParameter("id");
		String pwd = multipartRequest.getParameter("pwd");
		int age = Integer.parseInt(multipartRequest.getParameter("age"));
		String sex = multipartRequest.getParameter("sex");

		//UserDTO dto = userMapper.findAll();
		//System.out.println(dto.getEMP_ID());
		int num = userMapper.countNum() + 1;
		UserDTO user = new UserDTO(num,id,pwd,age,sex);
		
		if(userMapper.checkId(user) == 0) {
			userMapper.insertUser(user);
			HttpSession session = request.getSession();
			session.setAttribute("member", user);
			return new RedirectView("/");
		}
		else {
			return new RedirectView("/regist");
		}

	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public RedirectView login(MultipartHttpServletRequest multipartRequest, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		HttpSession session = req.getSession();
		String id = multipartRequest.getParameter("id");
		String pwd = multipartRequest.getParameter("pwd");

		int num = userMapper.getNum(new UserDTO (0, id,pwd, 0, ""));
		UserDTO user = new UserDTO (num, id,pwd, 0, "");
		UserDTO login = userMapper.login(user);

		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
		
		return new RedirectView("/");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public RedirectView logout(HttpSession session) throws Exception{
		session.invalidate();
		return new RedirectView("/");
	}
	
	@RequestMapping(value = "/showlike.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String showlike(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("member");

		ArrayList<LikeDTO> likelist = userMapper.showLike(user);

		ArrayList<String> likeall = new ArrayList<String>();
		for(int i=0;i<likelist.size();i++) {
			String sample = "" ;
			sample += ("{상의:"+ '"'+likelist.get(i).RST_DATA.split(",")[0]+'"');
			sample += (",하의:"+ '"'+likelist.get(i).RST_DATA.split(",")[1]+'"');
			sample += (",전신:"+ '"'+likelist.get(i).RST_DATA.split(",")[2]+'"');
			sample += (",외투:"+ '"'+likelist.get(i).RST_DATA.split(",")[3]+'"');
			sample += (",경로:"+ '"'+likelist.get(i).RST_PATH+'"' +"}");
			likeall.add(sample);
		}
		return likeall.toString();

	}

	
	@RequestMapping(value = "/cancellike.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String cancellike( HttpServletRequest request,
			HttpServletResponse response, Model model, RedirectAttributes rttr) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("member");

		int id = user.EMP_NUM;
		String likeurl = request.getParameter("cdata");
		System.out.println(likeurl);
		LikeDTO like = new LikeDTO(0,likeurl,"",id);
		userMapper.deleteLike(like);

		return "success";

	}
	
	@RequestMapping(value = "/userlike.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String userlike(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("member");
		ArrayList<LikeDTO> likelist = userMapper.showLike(user);
		ArrayList<String> likeall = new ArrayList<String>();
		for(int i=0;i<likelist.size();i++) {
			likeall.add(likelist.get(i).RST_PATH);
		}

		String age = "23";
		String sex = "Female";
		String fileName = likeall.toString();
		
		Client client = new Client("2",fileName,"", age, sex);
		JsonObject result = client.getResult();
		String recom = result.get("list").toString();
		
		recom = recom.replaceAll("NaN", "");
		return recom;

	}
}
