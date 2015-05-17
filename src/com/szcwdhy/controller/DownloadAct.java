package com.szcwdhy.controller;

import java.beans.IntrospectionException;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.szcwdhy.model.Coal;
import com.szcwdhy.model.CoalParam;
import com.szcwdhy.service.CoalService;
import com.szcwdhy.util.dialect.Pagination;
import com.szcwdhy.utils.BeanToMapUtil;
import com.szcwdhy.utils.DateUtil;
import com.szcwdhy.utils.ExcelUtil;

@Controller
public class DownloadAct {
	Logger log = Logger.getLogger(getClass());

	@Resource
	private CoalService coalService;

    @RequestMapping(value="/download/report")
    @Scope(value = "prototype")
    public String download(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam String serachTime,
    		@RequestParam String startTime,
    		@RequestParam String endTime,
    		@RequestParam(required = false, defaultValue = "1") int page,
    		@RequestParam(required = false, defaultValue = "currentPage") String exportType) throws IOException{
        String fileName="朔州车务段煤炭客户一览表（系统）";
        //填充Coal数据 cParam 参数转换条件查询
        CoalParam cParam = new CoalParam();
        cParam.setSearchTime(serachTime);
        cParam.setStartTime(startTime);
        cParam.setEndTime(endTime);
        
		Pagination pagination = getPagination(page, cParam);
        
		List<Coal> coalList = coalService.getCoalList(cParam,pagination, exportType);

        List<Map<String,Object>> list=createExcelRecord(coalList);
        String columnNames[]={"编号", "车站","煤站","发货单位","煤种","到站","车数","场存煤(t)","日上煤(t)"
        		,"自有煤矿","港存煤","发运情况"};//列名
        String keys[]   =    {"ID","station","coalStation","deliveryUnit","coalType","toStation",
        		"carNumber","changCunMei","riShangMei","ziYouMeiKuang","gangCunMei","theShipment"};//map中的key
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ExcelUtil.createWorkBook(list,keys,columnNames).write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return null;
    }
	private Pagination getPagination(int page, CoalParam cParam) {
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(page);
        pagination.setUrl("");
        pagination.setMaxPage(coalService.getCoalCount(cParam) / pagination.getPageSize() + 1);
		return pagination;
	}

    private List<Map<String, Object>> createExcelRecord(List<Coal> coalList) {
        List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("sheetName", "sheet1");
        listmap.add(map);
        Coal coal=null;
        for (int j = 0; j < coalList.size(); j++) {
            coal=coalList.get(j);
            Map<String, Object> mapValue = new HashMap<String, Object>();
			try {
				mapValue = BeanToMapUtil.convertBean(coal);
			} catch (IntrospectionException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            listmap.add(mapValue);
        }
        return listmap;
    }
}