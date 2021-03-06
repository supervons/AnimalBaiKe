<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.Login" %>
<%@ page import="com.animal.model.AnimalInfo,java.util.*" %>
<!doctype html>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en-gb" class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!--[if lt IE 9]> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
<title>动物百科-个人中心</title>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<meta name="description" content="">
<meta name="author" content="">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!--[if lte IE 8]>
		<script type="text/javascript" src="http://explorercanvas.googlecode.com/svn/trunk/excanvas.js"></script>
	<![endif]-->
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/isotope.css"
	media="screen" />
<link rel="stylesheet" href="${path}/js/fancybox/jquery.fancybox.css"
	type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="${path}/css/da-slider.css" />
<link rel="stylesheet" href="${path}/css/styles.css" />
<!-- Font Awesome -->
<link href="${path}/fonts/font-awesome.min.css" rel="stylesheet">
</head>

<body>
<%
Login loginSession =  (Login)session.getAttribute("loginsession");
String userId = loginSession==null?"":loginSession.getUserId();
%>
	<header class="header">
		<div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">
					<button type="button" id="nav-toggle" class="navbar-toggle"
						data-toggle="collapse" data-target="#main-nav">
						<span class="sr-only">导航</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="#" class="navbar-brand scroll-top logo"><b>动物百科</b>Animal BaiKe</a>
				</div>
				<!--/.navbar-header-->
				<div id="main-nav" class="collapse navbar-collapse">
					<ul class="nav navbar-nav" id="mainNav">
						<li><a href="${path}" class="scroll-link">首页</a></li>
						<li><a href="${path}/Navigation/goToDiscoverAnimal" class="scroll-link">发现动物</a></li>
						<li><a href="${path}/Navigation/goToShareAnimal" class="scroll-link">分享动物</a></li>
						<li><a href="${path}/Navigation/goToContactNature" class="scroll-link">亲近自然</a></li>
						<li class="active"><a href="${path}/Navigation/goToSeachRank" class="scroll-link">搜索排行</a></li>
						<li><a href="${path}/Navigation/goToUserInfo" class="scroll-link">个人中心</a></li>
						<li><a href="${path}/Navigation/goToAboutUs" class="scroll-link">关于我们</a></li>
						<li id="loginIn" style="display: block"><a href="${path}/Navigation/goToLogin" class="scroll-link">登陆</a></li>
						<li id="signOut" style="display: none"><a href="${path}/Navigation/goSignOut" class="scroll-link">退出</a></li>
					</ul>
				</div>
				<!--/.navbar-collapse-->
			</nav>
			<!--/.navbar-->
		</div>
		<!--/.container-->
	</header>
	<!--/.header-->
	<section id="contactNature" class="page-section">
		
	</section>
	<section id="seachRank" class="container" style="width:30%;margin-top:3% ">
		<section id="seachContentRank">
			<%
				List<Map<String, String>> seachRankList = (List<Map<String, String>>) session
						.getAttribute("seachRankList");
				String rankType =  (String)session.getAttribute("rankType");
				if (seachRankList != null) {
			%>
			<h4>
			<h4 id="allRank" class=".col-xs-1" style="float:left;margin-left:1%;display:none"">总排行</h4>
			<h4 id="monthRank" class=".col-xs-1"  style="float:left;margin-left:1%;display:none">当月排行</h4>
			<h4 id="weekRank" class=".col-xs-1" style="float:left;margin-left:1%;display:none">一周排行</h4>
			<input type="button" class=".col-xs-1 btn btn-default" style="float:right" value="周" onclick="showWeek()" >
			<input type="button" class=".col-xs-1 btn btn-default" style="float:right" value="月" onclick="showMonth()">
			<input type="button" class=".col-xs-1 btn btn-default" style="float:right" value="总" onclick="showAll()">			
			</h4>
			<table id="animalTable" class="table table-hover table-bordered text-center text-justify">
				<thead>
					<tr>
						<th>排名</th>
						<th>关键词</th>
						<th>指数</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < seachRankList.size(); i++) {
					%>
					<tr onclick="goToSeach('<%=seachRankList.get(i).get("seach_content")%>')">
						<td>
						 <%if(i==0){%><img style="width:25px" src="${path}/images/icon/firstIcon.png"><%} 
						 else if(i==1){%><img style="width:25px" src="${path}/images/icon/secondIcon.png"><%} 
						 else if(i==2){%><img style="width:25px" src="${path}/images/icon/thirdIcon.png"><%}
						 else {
						 %>	
						 <%=i+1%><%}%>					
						</td>
						<td ><%=seachRankList.get(i).get("seach_content")%></td>
						<td><%=String.valueOf(seachRankList.get(i).get("hot"))%></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
		</section>

	</section>
	<section class="seachRankBlank">
	</section>
	<!--/.page-section-->
	<section class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left copyRights">
						Copyright &copy; 2018.动物百科网，部分图片来源于网络，若有侵权，请联系删除！
						<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=934235475&amp;site=qq&amp;menu=yes">联系我们</a>
					</div>
				</div>
			</div>
			<!-- / .row -->
		</div>
	</section>
	<a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a>

	<!--[if lte IE 8]><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script><![endif]-->
	<script src="${path}/js/modernizr-latest.js"></script>
	<script src="${path}/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="${path}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${path}/js/jquery.isotope.min.js" type="text/javascript"></script>
	<script src="${path}/js/fancybox/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<script src="${path}/js/jquery.nav.js" type="text/javascript"></script>
	<script src="${path}/js/jquery.cslider.js" type="text/javascript"></script>
	<script src="${path}/js/Common.js" type="text/javascript"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js">
</script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0, index + 1);
	var i = 0;
    $(function(){
        var userId = '<%=userId%>';
        var rankType = '<%=rankType%>';
        if(rankType == "all"){
        	$("#allRank").show();
        }else if(rankType == "week"){
        	$("#weekRank").show();
        }else{
        	$("#monthRank").show();        	
        }
        if(userId == null || userId =="" || userId == undefined){
    		$("#signOut").hide();
        	$("#loginIn").show();
        }else{
        	$("#signOut").show();
        	$("#loginIn").hide();
        }
        });
    function showWeek(){
    	$.ajax({
			url : result + "/SeachRank/weekRank/",
			data : {
			},
			type : "GET",
			success : function(re) {
				location.reload();
			}
		});	
    }
    
    function showMonth(){
    	$.ajax({
			url : result + "/SeachRank/monthRank/",
			data : {
			},
			type : "GET",
			success : function(re) {
				location.reload();
			}
		});
    }
    
    function showAll(){
    	$.ajax({
			url : result + "/SeachRank/allRank/",
			data : {
			},
			type : "GET",
			success : function(re) {
				location.reload();
			}
		});      	
    }
    
    function goToSeach(seach_content){
    	console.log(seach_content);
		$.ajax({
			url : result + "/AnimalController/seachAnimal/",
			data : {
				seachWord:seach_content,
			},
			type : "POST",
			success : function(re) {
				window.location.href=result + "/Navigation/goToDiscoverAnimal?rank=yes";
			}
		});      	
    }
</script>
</body>
</html>