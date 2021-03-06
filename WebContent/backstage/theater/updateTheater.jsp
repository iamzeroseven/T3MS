<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.theater.model.*"%>
<%@ page import="com.cinema.model.*"%>
<%@ page import="java.io.Reader"%>
<%@ page import="org.json.*"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.jsp.SkipPageException"%>

<%
    TheaterVO theaterVO = (TheaterVO) request.getAttribute("theaterVO");
    CinemaService cSvc = new CinemaService();
    CinemaVO cinemaVO = cSvc.getOneCinema(request.getParameter("cinema_no"));
    pageContext.setAttribute("cinemaVO",cinemaVO);
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/addTheater.css">
    <style type="text/css">
    </style>
</head>

<body class="fs16">
    <%@ include file="/backstage/template/header.jsp" %>
    <div id="wrapper" class="mt50">
        <%@ include file="/backstage/template/sidebar.jsp" %>
        <div class="flex-column" id="page-content-wrapper">
            <div class="container">
                <h3 class="page-header">
                    <label>修改影廳&nbsp;&nbsp;</label>
                    <form id="fm-back" method="post" style="display:inline" action="<%=request.getContextPath()%>/backstage/theater/listAllTheater.jsp">
                        <button type="submit" id="back-btn" class="btn btn-default fs16 " >
                            <i class="fa fa-undo" aria-hidden="true"></i>&nbsp;返回
                        </button>
                        <!-- <input type="hidden" name="theater_no" value="${theaterVO.theater_no}"> -->
                        <!-- <input type="hidden" name="requestURL" value="<%=request.getServletPath()+"?"+request.getQueryString()%>"> -->
                        <input type="hidden" name="cinema_no" value="${param.cinema_no}">
                        <input type="hidden" name="whichRecordIndex" value="${param.whichRecordIndex}">
                        <!-- <input type="hidden" name="action" value="view"> -->
                    </form>
                </h3>
                <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/theater/theater.do">
                    <div class="form-group">
                      <label class="col-md-5 control-label">影城名稱</label>
                      <div class="col-md-3">
                        <input class="form-control" id="" type="text" value="${cinemaVO.cinema_name}" readonly>
                        <input id="cinema_no" type="hidden" name="cinema_no" value="${param.cinema_no}">
                      </div>
                      <div class="col-md-4">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-md-5 control-label">影廳名稱</label>
                      <div class="col-md-3">
                        <input class="form-control" id="" type="text" name="theater_name" value="${theaterVO.theater_name}" >
                      </div>
                      <div class="col-md-4">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-md-5 control-label">影廳設備</label>
                      <div class="col-md-3">
                        <select class="form-control" name="equipment">
                           <option value="數位" ${(theaterVO.equipment=="數位") ? 'selected': '' }>數位</option>
                           <option value="2D" ${(theaterVO.equipment=="2D")? 'selected': '' }>2D</option>
                           <option value="3D" ${(theaterVO.equipment=="3D")? 'selected': '' }>3D</option>
                           <option value="4DX" ${(theaterVO.equipment=="4DX")? 'selected': '' }>4DX</option>
                           <option value="4DX 3D" ${(theaterVO.equipment=="4DX 3D")? 'selected': '' }>4DX 3D</option>
                           <option value="IMAX" ${(theaterVO.equipment=="IMAX")? 'selected': '' }>IMAX</option>
                           <option value="IMAX 3D" ${(theaterVO.equipment=="IMAX 3D")? 'selected': '' }>IMAX 3D</option>
                           <option value="GC DIG" ${(theaterVO.equipment=="GC DIG")? 'selected': '' }>GC DIG</option>
                           <option value="GC 3D DIG" ${(theaterVO.equipment=="GC 3D DIG")? 'selected': '' }>GC 3D DIG</option>
                        </select>
                      </div>
                      <div class="col-md-4">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-md-5 control-label">排數</label>
                      <div class="col-md-3">
                        <select class="form-control" id="row" name="t_rows">
                          <c:forEach var="i" begin="5" end="26" step="1">
                            <option value="${i}" ${(theaterVO.t_rows==i)? 'selected': '' }>${i}</option>
                          </c:forEach>
                        </select>
                      </div>
                      <div class="col-md-4">
                      </div> 
                    </div>
                    <div class="form-group">
                      <label class="col-md-5 control-label">行數</label>
                      <div class="col-md-3">
                        <select class="form-control" id="col" name="t_columns">
                          <c:forEach var="j" begin="5" end="20" step="1">
                            <option value="${j}" ${(theaterVO.t_columns==j)? 'selected': '' }>${j}</option>
                          </c:forEach>
                        </select>
                      </div>
                      <div class="col-md-1">
                        <button type="button" class="btn btn-primary btn-md fs16" id="gen_seat">
                          <i class="fa fa-cog" aria-hidden="true"></i>&nbsp;產生座位
                        </button>
                      </div>
                      <div class="col-md-3">
                      </div>
                    </div>
                    <div id="seat_div">
                    </div>
                    <div class="form-group text-center">
                      <input type="hidden" name="action" value="update">
                      <input type="hidden" name="theater_no" value="${theaterVO.theater_no}">
                      <input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>">
                      <input type="hidden" name="whichRecordIndex" value="${param.whichRecordIndex}">
                      <button class="btn btn-basic fs16" id="smtbtn" type="submit" disabled><i class="fa fa-paper-plane" aria-hidden="true"></i>&nbsp;送出</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div id="loding_spinner" style="display: none;">
      <i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
      <span class="sr-only">座位產生中...</span>
    </div>

    <script src="<%=request.getContextPath()+"/js/back_index.js"%>"></script>
    <script type="text/javascript">
        //the same as addTheater.jsp, but a little different from addSession.jsp
        function gen_seat_theater(row, col, model) {
            $("#seat_div").empty();
            //$('#loding_spinner').fadeIn(200);
            //$('#loding_spinner').fadeOut(300, function(){
                console.log("row: " + row + " col: " + col);
                let content = "";
                for(let i = 1; i <= row; i++) {
                    content += "<div class='form-group text-center'>";
                    content += "<i class='fa fa-location-arrow fa-lg' aria-hidden='true'></i>&nbsp;" + ('0'+i).slice(-2) + "&nbsp;&nbsp;";
                    for(let j = 1; j <= col; j++) {
                        content += "<button type='button' class='seat btn ";
                        let key = i + "_" + j ;
                        switch(model[key][1]) {
                            case "0":
                                content += "btn-nonseat";
                                break;
                            case "2":
                                content += "btn-default";
                                break;
                            case "3":
                                content += "btn-warning";
                                break;
                            default:
                                console.log("switch default: ", model[key][1]);
                                break;
                        }

                        content += " btn-md' id='btn_" + i + "_" + j + "' " ;
                        /*
                        if(model[key][1] == "0") {
                            content += "disabled";
                        }
                        */
                        content += " >" + j + "</button>";
                        content += "<input type='hidden' name='input_" + i + "_" + j + "' id='input_" + i + "_" + j + "' value='" + model[key][1] + "'>&nbsp;";
                    }
                    content += "</div>";
                }
                $("#seat_div").append(content);
                $("#smtbtn").prop("disabled", false);
                $("#smtbtn").removeClass("btn-basic").addClass("btn-primary");
            //});
        }

        $(document).ready(function(){
            //$(".optbtn").on("click", function(event){
            $(document).on("click", ".optbtn", function(event){
                console.log("event.currentTarget.id: ", event.currentTarget.id);
                let tid = event.currentTarget.id;
                let input = $("#"+tid).attr("data-input");
                console.log("input id: ", input);
                console.log("input id: ", $("#"+input).attr("id"));
                console.log(input + " val: " + $("#"+input).val());
                $("#"+input).val($("#"+tid).attr("data-value"));
                let bid = $("#"+tid).attr("data-btn");
                console.log("bid ", "#"+bid);
                console.log("bid class", $("#"+bid).attr("class"));
                $("#"+bid).attr("class", ($("#"+tid).attr("class"))).removeClass("optbtn").addClass("seat").addClass("btn-md");
                $("#"+bid).popover("hide");
                //$("#"+bid).popover("destroy");
            });

            //$("#gen_seat").click(function(){
            $(document).on("click", "#gen_seat", function(event){
                //$(".fa-cog").addClass("fa-spin");
                //$(".fa-cog").removeClass("fa-spin");
                $("#seat_div").empty();
                $('#loding_spinner').fadeIn(200);
                //$('#loding_spinner').fadeOut();
                $('#loding_spinner').fadeOut(300, function(){
                  let row = $("#row").val();
                  let col = $("#col").val();
                  console.log("row: " + row + " col: " + col);
                  let content = "";
                  for(let i = 1; i <= row; i++) {
                      content += "<div class='form-group text-center'>";
                      content += "<i class='fa fa-location-arrow fa-lg' aria-hidden='true'></i>&nbsp;" + ('0'+i).slice(-2) + "&nbsp;&nbsp;";
                      for(let j = 1; j <= col; j++) {
                          content += "<button type='button' class='seat btn btn-default btn-md' id='btn_" + i + "_" + j + "'>" + j + "</button>";
                          content += "<input type='hidden' name='input_" + i + "_" + j + "' id='input_" + i + "_" + j + "' value='2'>&nbsp;";
                      }
                      content += "</div>";
                  }
                  $("#seat_div").append(content);
                  $("#smtbtn").prop("disabled", false);
                  $("#smtbtn").removeClass("btn-basic").addClass("btn-primary");
                });
            });

            $(document).on("click", ".seat", function(event){
                console.log("click event.currentTarget.id: ", event.currentTarget.id);
                let tid = event.currentTarget.id;
                let pos = tid.substring(3);
                console.log(pos);
                $("#"+tid).popover({
                    html:true,
                    placement: "top",
                    content: function(){
                        return "<div class='btn-group-vertical' style='border:0px'>" +
                                  "<button type='button' class='btn btn-nonseat optbtn' data-btn='"+ tid +"' data-value='0' id='opt"+ pos +"_0' data-input='input"+ pos +"'>非座位</button>" +
                                  "<button type='button' class='btn btn-default optbtn' data-btn='"+ tid +"' data-value='2' id='opt"+ pos +"_2' data-input='input"+ pos +"' style='border:0px'>可售座</button>" +
                                  "<button type='button' class='btn btn-warning optbtn' data-btn='"+ tid +"' data-value='3' id='opt"+ pos +"_3' data-input='input"+ pos +"' style='border:0px'>保留座</button>" +
                               "</div>";
                    }
                });
                $('#'+tid).popover("toggle");
            });

            //show errorMsgs
            <c:if test="${not empty errorMsgs}">
              <c:forEach var="message" items="${errorMsgs}">
                toastr.error("${message}");
              </c:forEach>
            </c:if>

            <%
            if(theaterVO != null) {
                // Reader model = theaterVO.getSeat_model();
                // char[] arr = new char[8 * 1024];
                // StringBuilder buffer = new StringBuilder();
                // int numCharsRead;
                // while ((numCharsRead = model.read(arr, 0, arr.length)) != -1) {
                    // buffer.append(arr, 0, numCharsRead);
                // }

                // model.close();
                // String strModel = buffer.toString();
                String strModel = theaterVO.getSeat_model();
                pageContext.setAttribute("strModel", strModel);
            }
            %>

            <c:if test="${not empty theaterVO}">
                <%-- different from addTheater.jsp  --%>
                <% if(request.getAttribute("rows") == null && request.getAttribute("cols") == null) { %>
                    let row = ${theaterVO.t_rows};
                    let col = ${theaterVO.t_columns};
                    console.log("rows & cols is null !")
                <% } else { %>
                    let row = ${rows};
                    let col = ${cols};
                <% } %>
                    let model = ${strModel};
                    gen_seat_theater(row, col, model);
            </c:if>

        });
    </script>
</body>
</html>