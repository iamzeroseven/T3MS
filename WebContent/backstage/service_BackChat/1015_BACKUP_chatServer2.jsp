<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.servicechat.controller.JedisHandleMessage"%>
<%@page import="com.member.model.MemVO"%>
<%@ page import="org.json.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
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
    </style>
</head>
 <%
    	String memid = "M0001";
//     	MemVO memVO = (MemVO) session.getAttribute("memVO");
//     	String mem_no = memVO.getmemno();
    	
    %>
<body onload="connect();" class="fs16">
    <%@ include file="/backstage/template/header.jsp" %>
    <div id="wrapper" class="mt50">
        <%@ include file="/backstage/template/sidebar.jsp" %>
        <div class="flex-column" id="page-content-wrapper">
            <div class="container-fluid mt20">
             <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">Service Chat</h3>
                </div>
                
               	<div style="height:500px;BACKGROUND-COLOR: #FFFFFF;
                 overflow-y:scroll; SCROLLBAR-FACE-COLOR: #c2d3fc;
                  SCROLLBAR-HIGHLIGHT-COLOR: #c2d3fc; SCROLLBAR-SHADOW-COLOR: BLACK;
                   SCROLLBAR-3DLIGHT-COLOR: #c2d3fc; SCROLLBAR-ARROW-COLOR:#000000; 
                   SCROLLBAR-TRACK-COLOR: FFFFFF; SCROLLBAR-DARKSHADOW-COLOR: EAECEC"
                    class="panel-body" id="content"></div>
            </div>
            <hr/>
            <input type="text" class="form-control" placeholder="message" aria-describedby="sizing-addon1" id="msg">
            <hr/>
            <button type="button" class="btn btn-lg btn-success btn-block" onclick="emit()">發送</button>
        </div>
<script>
$(window).scroll(function(){
    var scrollTop = $(this).scrollTop();
    var scrollHeight = $(document).height();
    var windowHeight = $(this).height();
    if(scrollTop + windowHeight == scrollHeight){
        alert("you are in the bottom");
    }
}); 
</script> 
<script type="text/javascript">
    	$(document).ready(function(){
    		$("#msg").focus();
    	});
</script>
 <script type="text/javascript">
		 	var MyPoint = "/FriendWS/Service";
			var host = window.location.host;
			var path = window.location.pathname;
			var webCtx = path.substring(0, path.indexOf('/', 1)); 
			var endPointURL = "ws://" + host + webCtx + MyPoint;
			var webSocket;
			
			function connect() {
				 webSocket = new WebSocket(endPointURL);
				
				 webSocket.onopen = function() {
					 <%
					 	List<String> list = JedisHandleMessage.getHistoryMsg("Service", "M0001");
					 	
					 	for(int i=list.size()-1; i>-1; i--){
					 		String oldTalk = list.get(i);
					 		JSONObject json = new JSONObject(oldTalk);
					 		String hisTemp = json.getString("message");
					 		%>
					 		$("#content").append("<hr><span style='border-radius:10px;box-shadow:1px 1px 3px red;background-color:#000;color: #" + "fff" + ";float:right; font-size: " + 12 + ";'>" + " <%=hisTemp%> " +  "</span><br/>");
					 <%}%>
					 $("#content").append("<kbd>Welcome!</kbd></br>");
				 };
				
			     webSocket.onmessage = function(evt) {
			         var data = JSON.parse(evt.data);
			         console.log("sender="+data.sender);
			         console.log("receiver="+data.receiver);
			         console.log("data.message="+data.message);
			         if(data.sender != undefined){
			        	 $("#content").append("<kbd style='color: #fff;font-size:16px ;margin-top: 10px;'>" + data.sender + ":" + data.message + "</kbd></br>");
			         }
			         console.log("DDD");
// 			         /* $("#content").append("<kbd style='color: #" + data.color + ";font-size: " + data.fontSize + ";margin-top: 10px;'>" + data.sender + " Say: " + data.message + "</kbd></br>"); */
			     };
			     
			     
			     webSocket.onclose = function(evt) {
			         $("#content").append("<kbd>" + "Close!" + "</kbd></br>");
			     }
			     webSocket.onerror = function(evt) {
			         $("#content").append("<kbd>" + "ERROR!" + "</kbd></br>");
			     }
			 }
			 document.onkeydown = function(event){
			     var e = event || window.event || arguments.callee.caller.arguments[0];
			     if(e && e.keyCode == 13){
			         emit();
			     }
	 		 }; 	
			
			
		 function emit() {
// 			 var text = $("#msg").val();
		     var text = encodeScript($("#msg").val());
		     var msg = {
		    		 "type":"XhistoryX",
		    		 "sender":"Service", 
		    		 "receiver":"M0001",
		    		 "message":text
		     };
// 		     var msg = {
// 		         "message" : text,
// 		         "color" : "#CECECE",
// 		         "bubbleColor" : "#2E2E2E",
// 		         "fontSize" : "16"
// 		     };
		     msg = JSON.stringify(msg);
		     //向server發送訊息
		     webSocket.send(msg);
		     $("#content").append("<hr><span style='border-radius:10px;box-shadow:1px 1px 3px red;background-color:#000;color: #" + "fff" + ";float:right; font-size: " + 12 + ";'>"+ "&nbsp;&nbsp;" + text + "&nbsp;&nbsp;" + "</span><br/>");
		     $("#msg").val("");
		 }
		 
		 function encodeScript(data) {
			    if(null == data || "" == data) {
			        return "";
			    }
			    return data.replace("<", "&lt;").replace(">", "&gt;");
			}
</script>
            </div>
        </div>
   
    <script src="<%=request.getContextPath()+"/js/back_index.js"%>"></script>
</body>
</html>