<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���������� ���� �ϱ�</title>
<script type="text/javascript">
function fn_modify_main_setting(){
	//alert("aaa");
	//üũ�� �׸��� ������ �´�.
	var chk_review_book=document.getElementById("chk_review_book");
	//alert(chk_review_book.checked);
	var chk_brand_book=document.getElementById("chk_brand_book");
	var chk_writer_book=document.getElementById("chk_writer_book");
	var chk_bestseller=document.getElementById("chk_bestseller");
	var chk_newbook=document.getElementById("chk_newbook");
	var chk_steadyseller=document.getElementById("chk_steadyseller")
	var chk_discount_book=document.getElementById("chk_discount_book")
	
	var review_book_yn='n';
	var writer_book_yn='n';
	var brand_book_yn='n';
	var bestseller_yn ='n';
	var steadyseller_yn='n';
	var discount_book_yn='n';
	var newbook_yn='n';
	
	if(chk_review_book.checked==true){
		review_book_yn='y';
	}
	
	if(chk_writer_book.checked==true){
		writer_book_yn='y';
	}
	
	if(chk_brand_book.checked==true){
		brand_book_yn='y';
	}
	
	if(chk_bestseller.checked==true){
		bestseller_yn='y';
	}
	if(chk_newbook.checked==true){
		newbook_yn='y';
	}
	
	if(chk_steadyseller.checked==true){
		steadyseller_yn='y';
	}
	
	if(chk_discount_book.checked==true){
		discount_book_yn='y';
	}
	
    alert(discount_book_yn);
	
	//ajax�� �������� ������ �����Ѵ�.
	$.ajax({
			type:"post",
			async : false, //false�� ��� ��������� ó���Ѵ�.
			url : "http://localhost:8090/bookshop01/mypage/modifyMainSetting.do",
			data : {
				review_book:review_book_yn,
				 writer_book:writer_book_yn,
				brand_book:brand_book_yn,
				
				bestseller:bestseller_yn,
				newbook:newbook_yn,
				steadyseller:steadyseller_yn,
				discount_book:discount_book_yn
				
			},
			success : function(data, textStatus) {
				alert("������ �����Ǿ����ϴ�!!!");	
			},
			error : function(data, textStatus) {
				alert("������ �߻��߽��ϴ�."+data);
			},
			complete : function(data, textStatus) {
				//alert("�۾����Ϸ� �߽��ϴ�");
			}
		}); //end ajax	
	
	
	
	
}
</script>
</head>
<body>
<center>
 <h1>����ȭ�� �����ϱ�</h1>
<table border="0" class="list_view" >
    <tr>
      <td width=60%>�ı� ���� ���� </td>
      <td width=40%><input type="checkbox" id="chk_review_book" /> </td>
    </tr>
    <tr>
      <td>�귣�庰 </td>
      <td><input type="checkbox" id="chk_brand_book" /> </td>
    </tr>
    <tr>
      <td>�۰���</td>
      <td><input type="checkbox" id="chk_writer_book" /> </td>
    </tr>
    <tr>
      <td>����Ʈ����</td>
      <td><input type="checkbox" id="chk_bestseller" /> </td>
    </tr>
    <tr>
      <td>���� ���� ����</td>
      <td><input type="checkbox" id="chk_newbook" /> </td>
    </tr>
    <tr>
      <td>���׵𼿷�</td>
      <td><input type="checkbox" id="chk_steadyseller" /> </td>
    </tr>
    <tr>
      <td>���εǴ� ����</td>
      <td><input type="checkbox" id="chk_discount_book" /> </td>
    </tr>
    <tr align=center>
      <td colspan=2>
        <input  type="button" value="�����ϱ�"  onClick="fn_modify_main_setting()"/>
        <input  type="button" value="���" />
      </td>
    </tr>
</table>
</center>
</body>
</html>