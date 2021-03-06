<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>memberlogin</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/login.css">
<!--===============================================================================================-->
<%@ include file="/forestage/template/link.jsp" %>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/T3MS/img/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-100">
<%@ include file="/forestage/template/header.jsp" %>
				<span class="login100-form-title p-b-41">
					<img style="width:400px;" src='/T3MS/img/login.png'>
				</span>
				
				<hr style="visibility:hidden">
				<hr style="visibility:hidden">
				<hr style="visibility:hidden">
				<form class="login100-form validate-form p-b-33 p-t-5" action="<%=request.getContextPath()%>/member/loginC.do"  method="post">

					<div class="wrap-input100 validate-input" data-validate="請確認信箱">
						<input class="input100" type="text" name="email" placeholder="帳號">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="請確認密碼">
						<input class="input100" type="password" name="paw" placeholder="密碼">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
                  
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							登入
						</button>
					</div>
				</form>
				<div class="container" style="align-content: right">
					<div class="align-items-end">
					<a style="color:deeppink;" href="registerf.jsp">註冊會員</a>
					<a style="color:deeppink;" href="forgotpaw.jsp">忘記密碼</a></div>
				</div>
			</div>
			 <%@ include file="/forestage/template/footer.jsp" %>
		</div>
	</div>
	
	
	
	
	
	<div id="dropDownSelect1"></div>
	<script src="/js/jquery-3./.1.min.js"></script>
	<script src="/js/login.js"></script>
	
</body>


<script type="text/javascript">
<% if(request.getAttribute("fail")!=null){%>
var input = $('.validate-input .input100');
for (var i = 0; i < input.length; i++) {
	showValidate(input[i]);
}
<% }%>	
	$('.validate-form .input100').each(function() {
		$(this).focus(function() {
			hideValidate(this);
		});
	});

	function validate(input) {
		if ($(input).attr('type') == 'email'
				|| $(input).attr('name') == 'email') {
			if ($(input)
					.val()
					.trim()
					.match(
							/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
				return false;
			}
		} else {
			if ($(input).val().trim() == '') {
				return false;
			}
		}
	}

	function showValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).addClass('alert-validate');
	}

	function hideValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).removeClass('alert-validate');
	}
</script>




</html>