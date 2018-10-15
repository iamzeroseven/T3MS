<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.nav_backstage.model.*"%>
<%@ page import="java.io.Reader"%>
<%@ page import="org.json.*"%>


<%
	NavService nSvc = new NavService();
	List<NavVO> nlist = nSvc.getall();
	pageContext.setAttribute("nlist",nlist);
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>M&amp;S</title>
    <%@ include file="/backstage/template/link.jsp" %>
    <style type="text/css">
    
body{
	margin: 0;
	padding: 0;
	font-family: Helvetica,"",Arial, sans-serif; 
	font-size: 16px;
	color:rgba(0, 0, 0, 0.7);
	background: url('../images/ODRAZ80.jpg');
}

.form-group{
	margin-bottom:1.5rem;
    margin-top: 1.5rem;
}

.login_box{
	margin: 100px auto 30px auto;
}

/*.login_left{
	color:#fff;
	background: rgba(0, 0, 0, 0.3);
	border-top-left-radius: .25rem;
	border-bottom-left-radius: .25rem;
	padding: 30px;
	position: relative;
}
.login_left h2{
	font-size: 5vw;
	line-height: 1;
	font-weight: bold;
	margin-bottom: 110px;
}

.memo_font{
	position: absolute;
    bottom: 25px;
    width: 85%;
}*/

.top_bar{
    background-color: #fff;
    padding: 10px;
    /**/
    box-shadow: 0px 0px 5px #2e2e2e; 
    -webkit-box-shadow: 0px 0px 5px #2e2e2e; 
    -moz-box-shadow: 0px 0px 5px #2e2e2e;
}
.top_bar a,.top_bar div{
	display: inline-block;
}

.login_right{
	background: #fff;
	border-radius: .25rem;
	padding: 30px;
	margin: 0 auto;
	max-width: 400px;
	/**/
    box-shadow: 0px 0px 5px #2e2e2e; 
    -webkit-box-shadow: 0px 0px 5px #2e2e2e; 
    -moz-box-shadow: 0px 0px 5px #2e2e2e;
}
.login_right h5{
	text-align: center;
}

.logo{
	max-width: 250px;
    margin: 0 auto 10px auto;
}

.btn_box{
	display: flex;
	justify-content: center;
}
.login_btn{
	border-radius: 2.25rem;
	border-radius: 2.25rem;
    width: 80px;
    margin: 20px 0;
}
.not_rem{
	margin: 10px 0;
}

.bottom_font{
	text-align: center;
	color: #696969;
}

@media screen and (max-width: 812px){
	.login_box{margin: 30px auto 30px auto;}
}
    </style>
</head>

<body class="fs16">
    <%@ include file="/backstage/template/header.jsp" %>
    <div id="wrapper" class="mt50">
        <%@ include file="/backstage/template/sidebar.jsp" %>
        <div class="flex-column" id="page-content-wrapper">
        
        
        <c:if test="${success!=null}">
				<div style="width:600px;margin:0 auto;" class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>

									<span style="color:green;font-size:30px;font-weight:bold">${success}</span>					
				</div>
			</c:if>
        
        
        
        
           <div class="row login_box">
			<div class=" login_right">
			<div class="row">
				<h5>MS後台-新增後台角色</h5>	
				<form method="post" action="<%=request.getContextPath()%>/backstage/role/Role.do">
					<input type='hidden' name='action' value="insert">
					<div class="form-group">
						<input type="text" class="form-control"  name="br_name" placeholder="角色名稱/role">		
					</div>

					<div class="form-group">
	                    <c:forEach var="navVO" items="${nlist}" varStatus="s" begin="<%=0%>" end="<%=nlist.size()%>">
	                    	<c:if test="${navVO.parent_id==null}">                                                                              
<%-- 								<div class="col-sm-6"><input id="v-${s.index}" type="checkbox" value="${navVO.listitem_no}" name="listitem_no"><label for="v-${s.index}"><span style="font-weight:bolder;">${navVO.listitem_name}</span></label><br></div> --%>
							</c:if>
							<c:if test="${navVO.parent_id!=null}">                                                                              
								<div class="col-sm-6"><input id="b-${s.index}" type="checkbox" value="${navVO.listitem_no}" name="listitem_no"><label for="b-${s.index}"><span style="font-weight:normal;">${navVO.listitem_name}</span></label><br></div>
							</c:if>
	                    </c:forEach>                       
					</div>
					
					
					<div class="btn_box col-sm-12">
						<button type="submit" class="btn btn-primary login_btn">新增</button>
					</div>
				</form>
			</div>
</div>
		</div>
           
        </div>
    </div>
    <script src="<%=request.getContextPath()+"/js/back_index.js"%>"></script>
</body>


</html>