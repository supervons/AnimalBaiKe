﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.UserInfo,com.animal.model.AnimalInfo,java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动物百科-登陆</title>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<link rel="stylesheet" href="${path}/css/reset.css" />
<link rel="stylesheet" href="${path}/css/login.css" />
<link rel="stylesheet" href="${path}/css/bootstrap-theme.css" />
<link rel="stylesheet" href="${path}/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="${path}/css/bootstrap.css" />
<!-- Bootstrap Styles-->
<link href="${path}/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="${path}/assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="${path}/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="${path}/assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><strong>动物百科-用户管理</strong></a>
				
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side text-center" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="${path}/Navigation/goApprovalAnimal">动物审批</a>
                    </li>

<!--                     <li> -->
<%--                         <a href="${path}/Navigation/goAnimalInfoManage">动物信息管理</a> --%>
<!--                     </li> -->

                    <li>
                        <a class="active-menu" href="${path}/Navigation/goUserManage">用户管理</a>
                    </li>

                    <li>
                        <a href="${path}/Navigation/goSendMsg">发送公告</a>
                    </li>
                    

                    <li>
                        <a href="#" onclick="window.open('${path}/Login/changePassword/','_blank','location=no,scrollbars=0,resizable=0,width=450px,height=300px,left=450,top=200;');">修改密码</a>
                    </li>
                    
                    <li>
                        <a href="${path}/Navigation/goSignOut">退出登陆</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
		<div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                        	用户管理
                        </h1>
									
		</div>
            <div id="page-inner">
	
		<div class="row">
      <%
      List<UserInfo> userInfoList = (List<UserInfo>)session.getAttribute("userInfoList");
      if(userInfoList!=null){
      %>
				<table id="animalTable" class="table table-hover" style="background-color: #ffffff">
					<thead>
						<tr>
							<th>用户姓名</th>
							<th>用户年龄</th>
							<th>用户性别</th>
							<th>用户电话</th>
							<th>联系地址</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<%for(int i =0;i<userInfoList.size();i++){ %>
						<tr>
							<td><%=userInfoList.get(i).getUserName()%></td>
							<td><%=userInfoList.get(i).getUserAge()%></td>
							<td><%=userInfoList.get(i).getUserSex()%></td>
							<td><%=userInfoList.get(i).getUserTel()%></td>
							<td><%=userInfoList.get(i).getUserAddress()%></td>
							<td>
							<input type="button" class="btn btn-default" onclick="resetUser('<%=userInfoList.get(i).getUserId()%>')" value="重置密码">
							<input type="button" class="btn btn-default" onclick="deleteUser('<%=userInfoList.get(i).getUserId()%>')" value="删除">
							</td>
						</tr>
						<%}%>
					</tbody>
				</table>
				<%}%>
			</div>
		</div>
        </div>
    </div>
    <script src="${path}/assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="${path}/assets/js/bootstrap.min.js"></script>
	 
    <!-- Metis Menu Js -->
    <script src="${path}/assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="${path}/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="${path}/assets/js/morris/morris.js"></script>
	
	
	<script src="${path}/assets/js/easypiechart.js"></script>
	<script src="${path}/assets/js/easypiechart-data.js"></script>
	
	 <script src="${path}/assets/js/Lightweight-Chart/jquery.chart.js"></script>
	
    <!-- Custom Js -->
    <script src="${path}/assets/js/custom-scripts.js"></script>

      <script>
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0, index + 1);
      function resetUser(userId){
    	  if(confirm("确定重置用户密码吗？")){
    		  $.ajax({
      			url : result + "/Login/resetPassword/",
      			data : {
      				userId:userId,
      			},
      			type : "POST",
      			success : function(re) {
      				alert("重置密码成功!重置为【123456】");
      				location.reload();
      			}
      		}); 
    	  }
    		
        }
      function deleteUser(userId){
    	  if(confirm("确定删除用户吗？")){
    		  $.ajax({
    	  			url : result + "/UserInfo/deleteUserInfo/",
    	  			data : {
    	  				userId:userId,
    	  			},
    	  			type : "POST",
    	  			success : function(re) {
    	  				alert("删除成功!");
    	  				location.reload();
    	  			}
    	  		}); 
    	  }
  		
      }
    
      </script>

</body>

</html>