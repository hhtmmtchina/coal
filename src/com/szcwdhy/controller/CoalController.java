package com.szcwdhy.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.szcwdhy.dao.CoalDao;
import com.szcwdhy.model.Coal;
import com.szcwdhy.model.CoalParam;
import com.szcwdhy.model.CoalType;
import com.szcwdhy.service.CoalService;
import com.szcwdhy.service.CoalTypeService;
import com.szcwdhy.util.dialect.Pagination;
import com.szcwdhy.utils.DateUtil;

@Controller
public class CoalController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource
	private CoalService coalService;
	
	@Resource
	private CoalTypeService coalTypeService;
	
	@RequestMapping(value = "/report")
	@ResponseBody
	@Scope(value = "prototype")
	public ModelAndView getReports(HttpServletRequest request, HttpServletResponse response,
			CoalParam cParam, @RequestParam(required = false, defaultValue = "1") int page){
		ModelAndView view = new ModelAndView();
		if(StringUtils.isNotBlank(cParam.getTimeType())){
			if("today".equals(cParam.getTimeType()))
				cParam.setSearchTime(DateUtil.getCurrentDate());
			else
				cParam.setSearchTime(DateUtil.getDayBefore());
		}
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(page);
//        pagination.setUrl(getCurrentUrl());
		int maxpage = coalService.getCoalCount(cParam) % pagination.getPageSize() == 0 ? 
			coalService.getCoalCount(cParam) / pagination.getPageSize() :
			coalService.getCoalCount(cParam) / pagination.getPageSize() +1;
			log.info(coalService.getCoalCount(cParam)+"==="+pagination.getPageSize());
        pagination.setMaxPage(maxpage);
        
		List<Coal> coalList = coalService.getCoalList(cParam,pagination, "currentPage");
		view.addObject("coalList", coalList);
		view.addObject("page", pagination);
		view.addObject("cParam", cParam);
		view.setViewName("/report_list");
		return view;
	}

	@RequestMapping(value = "/report/loaddata")
	@ResponseBody
	public ModelAndView getReportAdd(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		List<CoalType> stationList = coalTypeService.getCoalTypeList(1);
		List<CoalType> coalStationList = coalTypeService.getCoalTypeList(2);
		List<CoalType> deliveryUnitList = coalTypeService.getCoalTypeList(3);
		List<CoalType> meizhongList = coalTypeService.getCoalTypeList(4);
		mv.addObject("stationList", stationList);
		mv.addObject("coalStationList", coalStationList);
		mv.addObject("deliveryUnitList", deliveryUnitList);
		mv.addObject("meizhongList", meizhongList);
		mv.setViewName("report_add");
		return mv;
	}
	
	@RequestMapping(value = "/report/add")
	@ResponseBody
	@Scope(value = "prototype")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response,
			Coal coal, RedirectAttributes attr){
		ModelAndView view = new ModelAndView();
		coal.setCreatedTime(new Date());
		Integer id = coalService.getCoalAdd(coal);
		if(id>0) log.info("==========添加成功==========");
		else log.info("==========添加失败===========");
		attr.addFlashAttribute("message","<script>alert('添加成功！');</script>");   
		view.setViewName("redirect:/report");
		return view;
	}
	
	@RequestMapping(value = "/report/del/{id}")
	@ResponseBody
	@Scope(value = "prototype")
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer id, RedirectAttributes attr){
		ModelAndView view = new ModelAndView();
		
		coalService.delCoalById(id);
		if(id>0) log.info("==========删除成功==========");
		else log.info("==========删除失败===========");
		attr.addFlashAttribute("message","<script>alert('删除成功！');</script>");   
		view.setViewName("redirect:/report");
		return view;
	}
	
	@RequestMapping(value = "/report/edit/{id}")
	@ResponseBody
	@Scope(value = "prototype")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer id){
		ModelAndView view = new ModelAndView();
		
		List<CoalType> stationList = coalTypeService.getCoalTypeList(1);
		List<CoalType> coalStationList = coalTypeService.getCoalTypeList(2);
		List<CoalType> deliveryUnitList = coalTypeService.getCoalTypeList(3);
		List<CoalType> meizhongList = coalTypeService.getCoalTypeList(4);
		view.addObject("stationList", stationList);
		view.addObject("coalStationList", coalStationList);
		view.addObject("deliveryUnitList", deliveryUnitList);
		view.addObject("meizhongList", meizhongList);
		
		Coal coal = coalService.getCoalById(id);
		view.addObject("coal", coal);
		view.setViewName("report_edit");
		return view;
	}
	
	@RequestMapping(value = "/report/update")
	@ResponseBody
	@Scope(value = "prototype")
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response,
			Coal coal){
		ModelAndView view = new ModelAndView();
		Integer status = coalService.updateCoalById(coal);
		if(status > 0) log.info("===========更新成功========");
		else log.info("=========更新失败========");
		view.addObject("coal", coal);
		view.setViewName("redirect:/report");
		return view;
	}
}
