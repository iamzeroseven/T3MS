<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.activity.model.*"%>
<%@ page import="java.util.*"%>

<%
    AccountVO aVo= (AccountVO) session.getAttribute("aVO");
    String backstage_no = aVo.getBs_acc_no();
//  ActivityVO actVO = new ActivityVO();
    ActivityService actSvc = new ActivityService();
    List<ActivityVO> list = actSvc.getAll();
    pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>M&amp;S</title>
<%@ include file="/backstage/template/link.jsp"%>

<style type="text/css">
/* .table tbody tr td { */
/*  line-height: 219px; */
/*  font-size: 18px; */
/* } */
img {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 5px;
    width: 140px;
}
table.dataTable thead .sorting {
  background: url("<%=request.getContextPath()%>/img/sort_both.png") no-repeat center right;
}
table.dataTable thead .sorting_asc {
  background: url("<%=request.getContextPath()%>/img/sort_asc.png") no-repeat center right;
}
table.dataTable thead .sorting_desc {
  background: url("<%=request.getContextPath()%>/img/sort_desc.png") no-repeat center right;
}
table.dataTable thead .sorting_asc_disabled {
  background: url("<%=request.getContextPath()%>/img/sort_asc_disabled.png") no-repeat center right;
}
table.dataTable thead .sorting_desc_disabled {
  background: url("<%=request.getContextPath()%>/img/sort_desc_disabled.png") no-repeat center right;
}
</style>
</head>

<body class="fs16">
    <%@ include file="/backstage/template/header.jsp"%>
    <div id="wrapper" class="mt50">
        <%@ include file="/backstage/template/sidebar.jsp"%>
        <div class="flex-column" id="page-content-wrapper">
            <div class="container-fluid mt20">
                <!-- start -->
                <!--                <div class="container"> -->
                <h3 class="page-header">
                    <label>活動管理&nbsp;&nbsp;&nbsp;</label>
                    <button type="button" data-toggle="modal" data-target="#hanhan" class="btn btn-primary">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        <span class="fs16">&nbsp;新增活動</span>
                    </button>
                </h3>
                <%--                <%@ include file="page1.file"%><br> --%>
                <br>
                <!-- 新增視窗 Start -->
                <div class="modal fade" id="hanhan" tabindex="-1" role="dialog" aria-labelledby="hanhan" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title">新增活動</h4>
                            </div>
                            <form method="post" action="<%=request.getContextPath()%>/backstage/activity/activity.do" enctype="multipart/form-data">
                                <div class="modal-body">

                                    <div class="form-group">
                                        <input type="text" class="form-control" name="activity_name" placeholder="名稱">
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="8" style="resize: none" name="activity_desc" placeholder="內容描述"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <input type="file" class="form-control" name="img_pic" placeholder="圖片上傳">
                                    </div>
                                    <!--                 <div class="form-group"> -->
                                    <!--                     <input type="text" class="form-control" id="updated_at" placeholder="時間" -->
                                    <!--                            data-date-format="yyyy/mm/dd"> -->
                                    <!--                 </div> -->
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="activity_url" placeholder="參考連結">
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            <input type="radio" name="active" value="0" checked="checked">
                                            下線
                                        </label>
                                        <label>
                                            <input type="radio" name="active" value="1">
                                            上線
                                        </label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="action" value="insert" />
                                    <input type="hidden" name="backstage_no" value="<%=backstage_no %>" />
                                    <button type="button" class="btn btn-info" id="demoTest">DEMO</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary" id="save">確定</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--- if erroMsg open lightbox again--->
                <c:if test="${openupdatereplyform!=null}">
                    <script>
                        $("#hanhan").modal({
                            show : true
                        });
                    </script>
                </c:if>
                <!--- if erroMsg --->
                <!-- 新增視窗 End -->



                <table id="actTable" class="table table-striped table-bordered" style="width: 100%">
                    <thead>
                        <tr>
                            <th>活動編號</th>
                            <th>活動名稱</th>
                            <!-- <th>活動描述</th> -->
                            <th>後台人員編號</th>
                            <th>圖片</th>
                            <!-- <th>活動連結</th> -->
                            <!-- <th>建立日期</th> -->
                            <!-- <th>修改日期</th> -->
                            <th>活動狀態</th>
                            <th>設定</th>
                    </tr>
                </thead>
                    <tbody>
                        <c:forEach var="actVO" items="${list}" varStatus="s" begin="<%=0 %>" end="<%=list.size()%>">
                            <tr>
                                <td>${actVO.activity_no}</td>
                                <td>${actVO.activity_name}</td>
                                <td>${actVO.backstage_no}</td>
                                <td><img id="img_pic" src="<%=request.getContextPath() %>/DBGifReaderAct?activity_no=${actVO.activity_no}"></td>
                                <td>${actVO.active}</td>
                                <td>
                                    <form id="fm-view-${s.index}" method="post" class="dp-inline" action="<%=request.getContextPath()%>/backstage/activity/activity.do?activity_no=${actVO.activity_no}&action=getOne_For_Delete">
                                        <button type="submit" id="view-btn-${s.index}" class="btn btn-danger fs16 del-btn">
                                            <i class="fa fa-trash-o" aria-hidden="true"></i>
                                            &nbsp;刪除
                                        </button>
                                        <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                    </form>
                            </td>
                            </tr>

                        </c:forEach>
                    </tbody>

                </table>




                <!-- =========================刪除跳出的燈箱========================= -->
                <c:if test="${deleteAnn!=null}">

                    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
                        <form METHOD="post" action="<%=request.getContextPath()%>/backstage/activity/activity.do?activity_no=<%=request.getParameter("activity_no") %>&action=delete">
                            <div class="modal-dialog modal-md">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h3 class="modal-title" id="myModalLabel">活動刪除</h3>
                                    </div>
                                    <div class="modal-body">是否刪除活動編號：<%=request.getParameter("activity_no") %></div>

                                    <div class="modal-footer">

                                        <button type="submit" class="btn btn-danger">刪除</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <script>
                        $("#deleteModal").modal({
                            show : true
                        });
                    </script>
                </c:if>
                <!-- =========================刪除跳出的燈箱========================= -->


            </div>
            <!-- End -->
        </div>
    </div>

    <script src="<%=request.getContextPath() + "/js/back_index.js"%>"></script>
    <!-- <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script> -->
    <script src="<%=request.getContextPath()%>/js/dataTables.bootstrap.min.js"></script>
</body>
<script>
    $(document).ready(function(){
        var len = 10; // 超過10個字以"..."取代${end> page1.pageNumber}
        $("p").each(function(i) {
            if ($(this).text().length > len) {
                $(this).attr("title", $(this).text());
                var text = $(this).text().substring(0, len - 1) + "  ...";
                $(this).text(text);
            }
        });

        <c:if test="${not empty errorMsgs}">
        <c:forEach var="message" items="${errorMsgs}">
        toastr.error("${message}");
        </c:forEach>
        </c:if>
    });
</script>
<script>
    $(document).ready(function() {
        $('#actTable').DataTable({
            "language" : {
                "search" : "關鍵字搜尋",
                "lengthMenu" : "每頁 _MENU_ 筆記錄",
                "zeroRecords" : "查無記錄",
                "info" : "第 _PAGE_ 頁 ( 總共 _PAGES_ 頁 )",
                "infoEmpty" : "查無資料",
                "infoFiltered" : "(從 _MAX_ 條記錄過濾)",
                "paginate" : {
                    "previous" : "上一頁",
                    "next" : "下一頁"
                }
            }
        });
    });
</script>
</html>