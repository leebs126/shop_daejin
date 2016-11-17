package com.bookshop01.admin.popup.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.admin.goods.service.AdminGoodsService;
import com.bookshop01.common.controller.BaseController;

@Controller("adminPopupController")
@RequestMapping(value="/admin/popup")
public class PopupControllerImpl extends BaseController implements PopupController {
	@Autowired
	AdminGoodsService adminGoodsService;
	
	@RequestMapping(value="/adminPopupMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminGoodsMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String fileName=getFileName(request);
		ModelAndView mav = new ModelAndView(fileName);
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "admin_mode"); //마이페이지 사이드 메뉴로 설정한다.

		String _chapter=null,_pageNum=null,period;
		String _beginDate=null,_endDate=null,beginDate=null,endDate=null;
		int curChapter=0,curPageNum=0;
        _beginDate=request.getParameter("beginDate");
        _endDate=request.getParameter("endDate");
		_chapter=request.getParameter("chapter");
		_pageNum=request.getParameter("pageNum");
		
		if(_endDate==null){
			String [] temp=calcSearchPeriod().split(",");
			beginDate=temp[0];
			endDate=temp[1];
		}else{
			beginDate=_beginDate;
			endDate=_endDate;	
		}
		
		if(_chapter==null){
			curChapter=1;
		}else{
			curChapter=Integer.parseInt(_chapter);
		}
		if(_pageNum==null){
			curPageNum=1;
		}else{
			curPageNum=Integer.parseInt(_pageNum);
		}
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		condMap.put("chapter",curChapter);
		condMap.put("pageNum",curPageNum);
		condMap.put("beginDate",beginDate);
		condMap.put("endDate", endDate);
		ArrayList new_goods_list=adminGoodsService.listNewGoods(condMap);
		mav.addObject("new_goods_list", new_goods_list);
		
		String beginDate1[]=beginDate.split("-");
		String endDate2[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate2[0]);
		mav.addObject("endMonth",endDate2[1]);
		mav.addObject("endDay",endDate2[2]);
		
		mav.addObject("chapter", curChapter);
		mav.addObject("pageNum", curPageNum);
		return mav;
		
	}
}
