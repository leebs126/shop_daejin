package com.bookshop01.goods.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.bookshop01.goods.dao.GoodsDao;
import com.bookshop01.goods.dao.GoodsDaoImpl;
import com.bookshop01.goods.vo.GoodsBean;
import com.bookshop01.goods.vo.ReviewBean;
import com.bookshop01.member.vo.MemberBean;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	GoodsDao goodsDao;
	
	//로그인 시 조회 기능
	public HashMap<String,ArrayList<GoodsBean>> listGoods(MemberBean memberBean) throws Exception {
		String member_id=memberBean.getMember_id();
		
		ArrayList settingList=goodsDao.mainSettingList(member_id);
		
		HashMap<String,ArrayList<GoodsBean>> goodsMap=new HashMap<String,ArrayList<GoodsBean>>();
		for(int i=0;i<settingList.size();i++){
			GoodsBean goodsBean=(GoodsBean)settingList.get(i);
			String goods_type=(String)goodsBean.getGoods_type();
			ArrayList goodsList=goodsDao.listGoods(goods_type);
			goodsMap.put(goods_type,goodsList);
		}
		
		return goodsMap;
	}
	
	//로그아웃시 조회 기능
	public HashMap<String,ArrayList<GoodsBean>> listGoods() throws Exception {
		HashMap<String,ArrayList<GoodsBean>> goodsMap=new HashMap<String,ArrayList<GoodsBean>>();
		ArrayList goodsList=goodsDao.listGoods("bestseller");
		goodsMap.put("bestseller",goodsList);
		goodsList=goodsDao.listGoods("newbook");
		goodsMap.put("newbook",goodsList);
		
		goodsList=goodsDao.listGoods("steadyseller");
		goodsMap.put("steadyseller",goodsList);
		
		//검색 단어 테이블에서 자주 검색되는 단어를 가지고 온다.
		//ArrayList searchWordList=goodsDao.searchWordList();
		//goodsMap.put("searchWordList",searchWordList);
		
		//팝업 정보 가지고 오기
		ArrayList popupList=goodsDao.popupList();
		goodsMap.put("popupList", popupList);
		
		return goodsMap;
	}
	
	public ArrayList keywordSearch(String keyword) throws Exception {
		ArrayList list=goodsDao.keywordSearch(keyword);
		return list;
	}
	
	public ArrayList searchGoods(String searchWord) throws Exception{
		ArrayList goodsList=goodsDao.searchGoods(searchWord);
		return goodsList;
	}
	
	public HashMap goodsDetail(String goods_id,int chapter,int pageNum) throws Exception {
		HashMap goodsMap=new HashMap();
		GoodsBean goodsBean = goodsDao.goodsDetail(goods_id);
		goodsMap.put("goods", goodsBean);
		ArrayList imageList =goodsDao.goodsDetailImage(goods_id);
		goodsMap.put("imageList", imageList);
		
		ReviewBean reviewBean=new ReviewBean();
		reviewBean.setGoods_id(goods_id);
		reviewBean.setChapter(chapter);
		reviewBean.setPageNum(pageNum);
		
		ArrayList reviewList =goodsDao.reviewList(reviewBean);
		goodsMap.put("reviewList", reviewList);
		return goodsMap;
	}
	
	public void addReview(ReviewBean reviewBean) throws Exception{
		goodsDao.insertReview(reviewBean);
	}
}
