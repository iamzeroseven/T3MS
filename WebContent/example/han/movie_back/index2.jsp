<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>M&amp;S</title>

    <!-- <link rel="stylesheet" href="/T3MS/example/han/movie_back/css/base.css"> -->
    <!-- <link rel="stylesheet" href="<%=request.getContextPath()%>"> "/T3MS" --!>
    <!-- <link rel="stylesheet" href="<%=request.getServletPath()%>"> "/example/han/movie_back/index2.jsp" -->
    <!-- <link rel="stylesheet" href="<%=request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/")+1)%>"> "/example/han/movie_back/" -->
    <!-- <link rel="stylesheet" href="<%=request.getContextPath()+request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/")+1)+"css/base.css"%>"> -->
    <!-- <link rel="stylesheet" href="<%=request.getPathTranslated()%>"> "null" -->

    <link rel="stylesheet" href="<%=request.getContextPath()+request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/")+1)+"css/base.css"%>">

    <!-- include libraries(jQuery, bootstrap) -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <!-- header -->
    <nav class="navbar navbar-default">
        <div class="container">
            <!-- 螢幕變小的按鈕 -->
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">
                    <!-- <img id="backimg" src="/T3MS/example/han/movie_back/images/LOGO3.png" alt="logo"> -->
                    <img id="backimg" src="<%=request.getContextPath()+request.getServletPath().substring(0, request.getServletPath().lastIndexOf("/")+1)+"images/LOGO3.png"%>" alt="logo">
                </a>
            </div>
            <!-- 螢幕變小的按鈕 -->

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <!-- <li class="active">
                        <a href="index.html">
                            <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;後台首頁</a>
                    </li>
                    <li>
                        <a href="list-alt_list.html">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;用戶管理</a>
                    </li>
                    <li>
                        <a href="content.html">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;內容管理</a>
                    </li>
                    <li>
                        <a href="tag.html">
                            <span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;標籤管理</a>
                    </li> -->
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a aria-expanded="false" aria-haspopup="true" class="dropdown-toggle" role="button" data-toggle="dropdown">
                            Admin
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;前台首頁</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;個人主頁</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;個人設定</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;帳號中心</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的收藏</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- header -->


    <!-- sidebar -->

    <div class="navbar-default" id="slider_sub">
        <ul class="nav">
            <li>
                <!-- search -->
                <div class="input-group mysearch">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
                <!-- search -->
            </li>

            <!-- 檢舉管理 側邊折疊 -->
            <li>
                <a href="#sub1" data-toggle="collapse">檢舉管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub1" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;影評檢舉管理</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;設群平台管理</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;揪團</a>
                    </li>
                </ul>
            </li>
            <!-- 檢舉管理 側邊折疊 -->


            <!-- 會員帳號管理 側邊折疊 -->
            <li>
                <a href="#sub2" data-toggle="collapse">會員帳號管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub2" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;影評資格審核</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;查詢會員資料</a>
                    </li>
                </ul>
            </li>
            <!-- 會員帳號管理 側邊折疊 -->


            <!-- 後台帳號管理 側邊折疊 -->
            <li>
                <a href="#sub3" data-toggle="collapse">後台帳號管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub3" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;登入頁面</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;新增帳號</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;修改帳號</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;刪除帳號</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;查詢帳號</a>
                    </li>
                </ul>
            </li>
            <!-- 後台帳號管理 側邊折疊 -->


            <!-- 後台角色管理 側邊折疊 -->
            <li>
                <a href="#sub4" data-toggle="collapse">後台角色管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub4" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;新增角色/權限</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;修改角色/權限</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;刪除角色/權限</a>
                    </li>
                </ul>
            </li>
            <!-- 後台角色管理 側邊折疊 -->

            <!-- 電影院管理 側邊折疊 -->
            <li>
                <a href="#sub5" data-toggle="collapse">電影院管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub5" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;影城</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;影廳</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;電影場次</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;座位</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;票種/票價</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;餐點</a>
                    </li>
                </ul>
            </li>
            <!-- 電影院管理 側邊折疊 -->


            <!-- 電影資訊管理 側邊折疊 -->
            <li>
                <a href="#sub6" data-toggle="collapse">電影資訊管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub6" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;票房排行榜管理</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;電影影評管理</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;電影相關資訊</a>
                    </li>
                </ul>
            </li>
            <!-- 電影資訊管理 側邊折疊 -->

            <!-- 訂票系統管理 側邊折疊 -->
            <li>
                <a href="#sub7" data-toggle="collapse">訂票系統管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub7" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;查詢場次訂票狀況</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;查詢退票記錄</a>
                    </li>
                </ul>
            </li>
            <!-- 訂票系統管理 側邊折疊 -->


            <!-- 活動公告管理 側邊折疊 -->
            <li>
                <a href="#sub8" data-toggle="collapse">活動公告管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub8" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;公告管理</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;活動管理</a>
                    </li>
                </ul>
            </li>
            <!-- 活動公告管理 側邊折疊 -->


            <!-- 客服系統管理 側邊折疊 -->
            <li>
                <a href="#sub9" data-toggle="collapse">客服系統管理
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
                <ul id="sub9" class="nav collapse">
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;即時客服聊天室</a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="glyphicon glyphicon-list-alt"></span>&nbsp;歷史訊息</a>
                    </li>
                </ul>
            </li>
            <!-- 客服系統管理 側邊折疊 -->

        </ul>
    </div>
    <!-- sidebar -->

    <div class="page_main">
        <ol class="breadcrumb">
            <li>
                <a href="#">電影院管理</a>
            </li>
            <li>
                <a href="#">影城</a>
            </li>
            <!-- <li class="active">
                <a href="#">哦哦</a>
            </li> -->
        </ol>


        <!-- <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form method="post">
                        <textarea id="summernote" name="editordata"></textarea>
                    </form>
                </div>
            </div>
        </div> -->
    </div>





    <!-- include summernote css/js -->
	<!-- 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <script>
        $(document).ready(function () {
            $('#summernote').summernote();
        });
    </script>
    -->
</body>

</html>