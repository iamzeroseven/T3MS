<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
        <nav class="navbar navbar-inverse navbar-fixed-top navbar-custom">
            <div class="container">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="#"><img src="<%=request.getContextPath()%>/img/M&S-05Z.png"></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                  <ul class="nav navbar-nav">
                    <li class=""><a href="#">線上訂票</a></li>
                    <li><a href="#">合作影城</a></li>
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">電影資訊<span class="caret"></span></a>
                      <ul class="dropdown-menu font-custom">
                        <li><a href="#">電影時刻</a></li>
                        <li><a href="#">電影介紹</a></li>
                        <li><a href="#">電影影評</a></li>
                      </ul>
                    </li>
                    <li><a href="#">社群平台</a></li>
                    <li><a href="#">會員專區</a></li>
                    <li><a href="#">揪團看電影</a></li>
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">客服中心<span class="caret"></span></a>
                      <ul class="dropdown-menu font-custom">
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">線上客服</a></li>
                        <li><a href="#">聯絡我們</a></li>
                      </ul>
                    </li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;註冊</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登入</a></li>
                  </ul>
                </div>
            </div>
        </nav>
        <!-- search bar > -->
        <div class="container-fluid">
            <div class="col-md-4 col-md-offset-4 search-bar-margin">
                <div class="input-group">
                    <input type="text" class="form-control input-lg text-center font-custom-large" name="search" placeholder="搜尋電影時刻" aria-label="搜尋電影時刻">
                    <span class="input-group-addon"><a href="#" title="搜尋電影時刻"><i class="fa fa-search fa-2x" aria-label="搜尋電影時刻"></i></a></span>
                </div>
            </div>
        </div>