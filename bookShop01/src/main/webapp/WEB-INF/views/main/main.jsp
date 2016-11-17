<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<style>
#layer_newbook{
	z-index: 5;
	position: absolute;
	top: 30%;
	left: 0px;
	width: 100%;
}

#popup {
	z-index: 6;
	position: absolute;
	text-align: center;
	left: 25%;
	top: 30%;
	width: 700px;
	height: 500px;
	background-color: #ccffff;
	border: 3px solid #87cb42;
}

#image_newbook {
	z-index:7;
}

#close {
	z-index: 6;
	float: right;
}
</style>

<script>
 function test(){
	 alert("aaa");
 }
 
 function showPopup(type) {
		if (type == 'open') {
			// 팝업창을 연다.
			jQuery('#layer_newbook').attr('style', 'visibility:visible');

			// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
			jQuery('#layer_newbook').height(jQuery(document).height());
		}

		else if (type == 'close') {

			// 팝업창을 닫는다.
			jQuery('#layer_newbook').attr('style', 'visibility:hidden');
		}
	} 
 
</script>
<div id="ad_main_banner">
	<ul class="bjqs">
		<li><img width="775" height="145" src="${pageContext.request.contextPath}/resources/image/main_banner1.jpg"></li>
		<li><img width="775" height="145" src="${pageContext.request.contextPath}/resources/image/main_banner2.jpg"></li>
		<LI><img width="775" height="145" src="${pageContext.request.contextPath}/resources/image/main_banner3.jpg"></LI>
	</ul>
</div>
<div class="main_book">
   <c:set  var="goods_count" value="0" />
	<h3>베스트셀러</h3>
	<c:forEach var="item" items="${goodsMap.bestseller }">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			<img class="link"  src="${pageContext.request.contextPath}/resources/image/1px.gif"> 
			</a> 
				<img width="121" height="154" 
				     src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">

			<div class="title">${item.goods_title }</div>
			<div class="price">
		  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		          ${goods_price}원
			</div>
		</div>
	</c:forEach>
	<c:if test="${goods_count==15   }">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
</div>
<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${pageContext.request.contextPath}/resources/image/sub_banner2.jpg">
</div>
<div class="main_book" >
<c:set  var="goods_count" value="0" />
	<h3>새로 출판된 책</h3>
	<c:forEach var="item" items="${goodsMap.newbook }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link"  src="${pageContext.request.contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="121" height="154" 
				src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		<div class="title">${item.goods_title }</div>
		<div class="price">
		    <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		       ${goods_price}원
		  </div>
	</div>
	</c:forEach>
	 <c:if test="${goods_count==15   }">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
</div>

<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${pageContext.request.contextPath}/resources/image/sub_banner1.jpg">
</div>

<div  class="main_book">
<c:set  var="goods_count" value="0" />
	<h3>스테디셀러</h3>
	<c:forEach var="item" items="${goodsMap.steadyseller }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link"  src="${pageContext.request.contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="121" height="154" 
				src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		<div class="title">${item.goods_title }</div>
           <div class="price">
		    <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		       ${goods_price}원
		  </div>
	</div>
	</c:forEach>
</div>	
   <c:if test="${goods_count==15  }">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
   <div class="clear"></div>
   
<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${pageContext.request.contextPath}/resources/image/sub_banner1.jpg">
</div>

<c:if test="${isLogOn==true and !empty  goodsMap.writer_book  }">
<div  class="main_book">
<c:set  var="goods_count" value="0" />
	<h3>작가별</h3>
	<c:forEach var="item" items="${goodsMap.writer_book }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link"  src="${pageContext.request.contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="121" height="154" 
				src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		<div class="title">${item.goods_title }</div>
           <div class="price">
		    <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		       ${goods_price}원
		  </div>
	</div>
	</c:forEach>
</div>	
   <c:if test="${goods_count==15  }">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
   <div class="clear"></div>   
</c:if>   

<c:forEach var="item" items="${goodsMap.popupList}" >
<div id="layer_newbook" style="visibility:visibile">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="#"> 
			<img src="${pageContext.request.contextPath}/resources/image/close.png" id="close" onClick="showPopup('close')" />
			</a> <br />
			 <font size="2" id="contents"><p id="message">${item.popup_message }</p></font><br>
			 <div  id="image_newbook" >
			 <a href="javascript:test()">
			    <img width=500 height=300  
			       src="${pageContext.request.contextPath}/fileDownload.do?goods_id=${item.goods_id}&fileName=${item.popup_imagename}" />  
		    </a>
		    </div>
		     오늘 그만 보기<input  type="checkbox"  />
		    
	   <div>
   </div>
</div>
</c:forEach>   