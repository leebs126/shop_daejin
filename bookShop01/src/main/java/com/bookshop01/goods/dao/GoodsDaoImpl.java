package com.bookshop01.goods.dao;

import java.io.Reader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.bookshop01.goods.vo.GoodsBean;
import com.bookshop01.goods.vo.ReviewBean;

@Repository("goodsDao")
public class GoodsDaoImpl  implements GoodsDao{
	@Autowired
	private SqlSession sqlSession;

	public ArrayList listGoods(String goods_type ) throws Exception {
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.listGoods",goods_type);
	   return list;	
     
	}
	
	public ArrayList keywordSearch(String keyword) throws Exception {
	   ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.keywordSearch",keyword);
	   return list;
	}
	
	public ArrayList searchGoods(String searchWord) throws Exception{
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.searchGoods",searchWord);
		 return list;
	}
	
	public GoodsBean goodsDetail(String goods_id) throws Exception {
		GoodsBean goodsBean=(GoodsBean)sqlSession.selectOne("mapper.goods.goodsDetail",goods_id);
		return goodsBean;
	}
	
	public ArrayList goodsDetailImage(String goods_id) throws Exception {
		 ArrayList imageList=(ArrayList)sqlSession.selectList("mapper.goods.goodsDetailImage",goods_id);
		return imageList;
	}
	
	public ArrayList reviewList(ReviewBean reviewBean) throws Exception{
		 ArrayList reviewList=(ArrayList)sqlSession.selectList("mapper.goods.reviewList",reviewBean);
			return reviewList;
	}
	public void insertReview(ReviewBean reviewBean) throws Exception{
		sqlSession.insert("mapper.goods.insertReview",reviewBean);
	}
	public ArrayList mainSettingList(String member_id) throws Exception{
		ArrayList settingList=(ArrayList)sqlSession.selectList("mapper.goods.mainSettingList",member_id);
		return settingList;
	}
	public ArrayList searchWordList() throws Exception{
		ArrayList searchWordList=(ArrayList)sqlSession.selectList("mapper.goods.searchWordList");
		return searchWordList;
	}
	
	public ArrayList popupList() throws Exception{
		ArrayList popupList=(ArrayList)sqlSession.selectList("mapper.goods.popupList");
		return popupList;
	}
}
