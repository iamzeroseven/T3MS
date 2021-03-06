<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.filmreview.model.*"%>

<%
	FilmreviewVO filmreviewVO = (FilmreviewVO) request.getAttribute("filmreviewVO");
%>

<%session.getAttribute("memVO"); %>
<jsp:useBean id="mvSvc" scope="page" class="com.movie.model.MovieService" />
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">


<%@ include file="/forestage/template/link.jsp"%>
<title>M&amp;S</title>

<link rel="stylesheet" href="/T3MS/css/jsRapStar.css" />
<script src="/T3MS/js/jsRapStar.js"></script>


<style>
.toto {
	margin-top: 60px;
}

.ctnr {
	border-radius: 5px;
	background-color: rgb(238, 238, 238);
	padding: 20px;
}
</style>

</head>

<body data-spy="scroll" class="body-template">
	<%@ include file="/forestage/template/header.jsp"%>
	
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	<script>
		$(document).ready(function() {
		       $('#summernote').summernote({        	  
		        	  tabsize: 2,
		              height: 600,
		              focus: true                  // set focus to editable area after initializing summe		          
		    });
			$('#dem5').jsRapStar({
				colorFront : 'yellow',
				length : 5,
				starHeight : 26,
				step : false,
				onClick : function(score) {
					score = score.toFixed(1);
					$(this)[0].StarF.css({
						color : 'yellow'
					});
					document.getElementById("inputEmail").value = score;
				},
				onMousemove : function(score) {
					score = score.toFixed(1);
					$(this).attr('title', score);
				}
			});
		});
	</script>




	<form METHOD="post" ACTION="<%=request.getContextPath()%>/filmreview/filmreview.do" class="form-horizontal" role="form">

		<div class="container ctnr">
			<div class="row ">
				<div class="text-center">
					<c:if test="${not empty errorMsgs}">


						<c:forEach var="message" items="${errorMsgs}">
							<div style="color: red">${message}</div>
						</c:forEach>

					</c:if>
				</div>

				<div class="col-md-12 toto">

					<div class="form-group ">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">選擇電影</label>
						</div>
						<div class="col-sm-10">
						 <select class="form-control" name="movie_no">
                        <c:forEach var="mVO" items="${mvSvc.all}" >
                           <option value="${mVO.movie_no}">${mVO.movie_name}</option>
                        </c:forEach>>
                        </select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">影評標題</label>
						</div>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputEmail3" name="title" value="" placeholder="影評標題">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">評分</label>

						</div>
						<div class="col-sm-2">
							<div id="dem5" start="5"></div>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="inputEmail" name="evaluation" value="<%=(filmreviewVO == null) ? "5.0" : filmreviewVO.getEvaluation()%>" placeholder="評分" readonly="value">
						</div>
					</div>
				</div>
			
				
				<div class="row" >
					<div class="col-sm-12">
						<label for="inputPassword3" class="control-label" style="margin-left:13px;margin-bottom:13px;">內容</label>
					</div>
				</div>
			
			
				<div class="row">
					<div class="col-md-12">

						<input type="hidden" name="action" value="insert">
						<textarea id="summernote" name="content" >
							
						</textarea>

					</div>
				</div>
		
				<div class="row">
					<div class="col-md-12">


						
						

						<div class="col-md-12 text-center">
							<input type="hidden" name="mem_no" value="${memVO.memno }">
							<input type="hidden" name="action" value="insert">
							<button type="submit" class="btn btn-default">發佈</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
<div class="col-sm-12 text-center" style="font-size:20px;margin-top:20px;">
<a href="/T3MS/forestage/filmreview/fv_home.jsp"><img src="/T3MS/img/House-Icon.png" style="height:40px;edith:40px;"></a>
</div>
	<%@ include file="/forestage/template/footer.jsp"%>

	<script src="<%=request.getContextPath()%>/js/template.js"></script>
	<script>
		$(document).ready(function() {
			$("li:contains('電影資訊')").addClass("custom-active");
		});
	</script>

</body>
</html>