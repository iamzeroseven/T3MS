<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.movie.model.*"%>

<%
	MovieVO movieVO = (MovieVO) request.getAttribute("movieVO"); //MovieServlet.java (Concroller) 存入req的movieVO物件 (包括幫忙取出的movieVO, 也包括輸入資料錯誤時的movieVO物件)
%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>M&amp;S</title>
<%@ include file="/backstage/template/link.jsp"%>
<!-- movie_back_movie CSS -->
<link
	href="/css/movie_back_movie.css"
	rel="stylesheet" type="text/css">
<style type="text/css">

<style>

.table {border: 5px solid black;}
.table tr:nth-child(even) {background: #FFF; }
.table tr:nth-child(odd) {background: #FAEBD7; }
.table tbody tr td{line-height:219px; font-size:18px;} 

a {text-decoration:none; color:black;text-decoration:blink;}
  
input[type=text] {
    padding:5px; 
    border:2px solid #ccc; 
    -webkit-border-radius: 5px;
    border-radius: 5px;
}

input[type=text]:focus {
    border-color:#255;
}

input[type=submit] {
    padding:5px 15px; 
    background: linear-gradient(to bottom, rgba(195,217,255,1) 0%,rgba(177,200,239,1) 41%,rgba(152,176,217,1) 100%);
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
   
   }
   
img {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 5px;
    width: 140px;
}

#btn6 {
    background-color: #00FFFF; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    position: absolute;
    top: 45px;
    right: 15px;

}


#btn6:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

#upbtn,#delbtn{
	line-height:2;
	position:relative;
	top:23%;
	vertical-align:middle;
}

</style>

</head>

<body class="fs16">
	<%@ include file="/backstage/template/header.jsp"%>
	<div id="wrapper" class="mt50">
		<%@ include file="/backstage/template/sidebar.jsp"%>
		<div class="flex-column" id="page-content-wrapper">

		
<!--查詢單一movie資訊 -->
			
			<div class="section">
				<div class="container">
					<div class="row">
						<div class=" col-md-12 text-left">
							<div class="page-header">
								<h1>
									電影管理
									<font color="#777777"> 
									  <span
										style="font-size: 23.4px; line-height: 23.4px;">
										Movie management&nbsp;
									  </span>											
									</font>
								</h1>
							</div>
						</div>
					</div>					
				</div>
			</div>
											
			<div class="section">
				<div class="container">
					<div class="hidden-md row">
						<div class="col-md-12 text-justify">
						
							<table class="table">

								<tr>
									<th class="active">電影編號</th>
									<th class="active">電影名稱</th>
									<th class="active">電影英文名稱</th>
									<th class="active">片長(分鐘)</th>
									<th class="active">上映日期</th>
									<th class="active">是否上線</th>
									<th class="active">圖片預覽</th>
								</tr>
																
								<tr>										
									<td>${movieVO.movie_no}</td>
									<td>${movieVO.movie_name}</td>
									<td>${movieVO.eng_name}</td>
									<td>${movieVO.length}</td>
									<td><fmt:formatDate value="${movieVO.relased}" pattern="yyyy-MM-dd"/></td>
									<td>${movieVO.active}</td>										
									<td><img id="movie_pic" src="<%=request.getContextPath() %>/DBGifReader?movie_no=${movieVO.movie_no}"></td>	
								</tr>
								
							</table>
						
						
							
						</div>
					</div>
				</div>
			</div>

<!--查詢單一movie資訊 -->

		</div>
	</div>
	
</body>
</html>