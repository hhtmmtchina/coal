package com.szcwdhy.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.code.kaptcha.Constants;
import com.szcwdhy.model.User;
import com.szcwdhy.service.UserService;
import com.szcwdhy.util.dialect.Pagination;

@Controller
public class UserController {
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Resource
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@Scope(value="prototype")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, 
			User user){
		ModelAndView view = new ModelAndView();
		if(StringUtils.isBlank(user.getCheckcode()) || 
				!user.getCheckcode().equals(request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY))){
			view.addObject("message", "<script>alert('验证码错误!');</script>");
			view.setViewName("/login");
			return view;
		}
		User user2 = userService.getUser(user);
		if(user2 == null){
			view.addObject("message", "<script>alert('用户名或密码错误!');</script>");
			view.setViewName("/login");
		} else{
			view.setViewName("index");
		}
		return view;
	
	}
	@RequestMapping(value = "/user/save", method=RequestMethod.POST)
	@Scope(value="prototype")
	public ModelAndView setUser(HttpServletRequest request, HttpServletResponse response, User uParam,
			RedirectAttributes attr){
		ModelAndView mv = new ModelAndView();//redirect模式  
		boolean isExist = isExistUser(uParam);
		if(isExist){
			mv.addObject("message", "<script>alert('已经存在该用户！');</script>");
			mv.setViewName("/user/user");
			return mv;
		}
		uParam.setCreatedtime(new Date());
		uParam.setUpdatedtime(new Date());
		boolean status = userService.saveUser(uParam);
		log.info("===========save status:"+status+"=========");
		attr.addFlashAttribute("success","<script>alert('保存用户成功！');</script>");   
		mv.setViewName("redirect:/user/list");
		return mv;
	}

	private boolean isExistUser(User uParam) {
		User user = new User();
		user.setUsername(uParam.getUsername());
		user.setPassword(uParam.getPassword());
		user.setUsertype(uParam.getUsertype());
		User userExist = userService.getUser(user);
		if(userExist != null) return true;
		return false;
	}
	
	@RequestMapping(value = "/user/list")
	@ResponseBody
	@Scope(value="prototype")
	public ModelAndView getUsers(HttpServletRequest request, HttpServletResponse response, User uParam,
			@RequestParam(required = false, defaultValue = "1") int page){
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(page);
//        pagination.setUrl(getCurrentUrl());
		int maxpage = userService.getUserCount() % pagination.getPageSize() == 0 ? 
				userService.getUserCount() / pagination.getPageSize() :
				userService.getUserCount() / pagination.getPageSize() +1;
			log.info(userService.getUserCount()+"==="+pagination.getPageSize());
        pagination.setMaxPage(maxpage);
        
		List<User> userList = userService.getUsers(uParam, pagination);
		log.info("===========get users:"+toJsonString(userList)+"=========");
		request.setAttribute("userList", userList);
		request.setAttribute("page", pagination);
		ModelAndView view = new ModelAndView("user/user_list");
        view.addObject("userList", userList);
		return view;
	}
	
	private String toJsonString(List<User> userList) {
		if(userList.size() == 0) return null;
		String jsonString = JSONArray.fromObject(userList).toString();
		return jsonString;
	}
	
	@RequestMapping(value = "/user/edit/{id}")
	@ResponseBody
	@Scope(value="prototype")
	public ModelAndView editUser(HttpServletRequest request, HttpServletResponse response, @PathVariable Integer id){
		ModelAndView view = new ModelAndView();
		view.setViewName("/error");
		if(id == null) return view;
		
		
		User user = userService.getUser(id);
		view.addObject("user", user);
		log.info("===========get user by id="+id+", "+user+"=========");
		
		view.setViewName("/user/edit_user");
		return view;
	}

	@RequestMapping(value = "/user/update/{id}")
	@ResponseBody
	@Scope(value="prototype")
	public ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response, User uParam){
		uParam.setUpdatedtime(new Date());
		Integer status = userService.updateUser(uParam);
		log.info("===========update status:"+status+"=========");
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/user/list");
		return view;
	}
	
	@RequestMapping(value = "/user/delete/{id}", method=RequestMethod.GET)
	@ResponseBody
	@Scope(value="prototype")
	public ModelAndView deleteUser(@PathVariable("id") Integer id, 
			HttpServletRequest request, HttpServletResponse response, 
			RedirectAttributes attr){
		Integer status = userService.deleteUser(id);
		log.info("===========delete status:"+status+"=========");
		attr.addFlashAttribute("success", "<script>alert('删除成功!');</script>");

		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/user/list");
		return view;
	}
}
