<%@page import="system.bean.Userinfo"%>
<%@page import="system.dao.impl.UserDAOImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
     Userinfo userinfo = (Userinfo) session.getAttribute("Userinfo");
 %>

    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>个人信息管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href="info/css/font-awesome.min.css" rel="stylesheet">
    <link href="info/css/bootstrap.min.css" rel="stylesheet">
    <link href="info/css/templatemo-style.css" rel="stylesheet">
  </head>
  <body>  
  <%
     
     Userinfo userinfo1 = (Userinfo) session.getAttribute("Userinfo");
     
     %>
  	
  
  
  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>个人信息管理</h1>
        </header>
        <div class="profile-photo-container">
          <img src="info/images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">  
          <div class="profile-photo-overlay"></div>
        </div>      

        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">          
          <ul>

            <li><a href="manageUserInfo.jsp"><i class="fa fa-bar-chart fa-fw"></i>地址管理</a></li>
            <li><a href="data-visualization.html"><i class="fa fa-database fa-fw"></i>订单管理</a></li>
            <li><a href="maps.html"><i class="fa fa-map-marker fa-fw"></i>购物车管理</a></li>
            <li><a href="modifyPassword"><i class="fa fa-users fa-fw"></i>修改密码</a></li>
            <li><a href="preferences.html"><i class="fa fa-sliders fa-fw"></i>退出登录</a></li>
            <li><a href="index.jsp"><i class="fa fa-eject fa-fw"></i>商城首页</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">
	<!-- ********************************************************* -->
	<br>
	<br>
	<h1>修改密码</h1>
	<br><br><br><br><br><br><br><br><br>
	<div class="container-fluid">
	
	<form method="post" action="modifyUserPassword_deal.jsp">
    				
					<table width="280" border="0" height="100px"
						 class="table">						
						<tr>
							<td height="60" style="font-size:20px;">
								<div align="right" >密码：</div>
							</td>
							<td>
								<div align="left">
								 <input type="text" name="password" id="password" style="height:30px">
								</div>
							</td>
						<% 
        	                String errorMsg = (String)session.getAttribute("errorMsg");
			                if(errorMsg != null){
		                  %>
		                  <%						   
			                 } %>
							<td colspan="2" style="color:red;"><%=errorMsg%></td>
						</tr>
						<tr>
							<td height="60" style="font-size:20px;">
								<div align="right">新密码：</div>
							</td>
							<td>
								<div align="left">
									<input type="text" name="newPassword" id="newPassword" style="height:30px">
								</div>
							</td>
						<% 
        	                String error_pwd = (String)session.getAttribute("error_pwd");
			                if(error_pwd != null){
		               %>
		      
			     <td colspan="2" style="color:red;"><%=error_pwd%></td>
		   
			<%						   
			} %>
						</tr>
						
						<tr>
							<td height="60" style="font-size:20px;">
								<div align="right">确定密码：</div>
							</td>
							<td>
								<div align="left">
									<input type="text" name="confirmPassword" id="confirmPassword" style="height:30px">
								</div>
							</td>
						</tr>
       
        <tr>
							<td colspan="2" align="center"><input type="submit" 
								value="确定" width="55" height="25" /> <input type="reset"
									class="resetBtn" value="取消" width="55" height="25" />
										&nbsp;&nbsp; </td>
						</tr>
						
						</table>
						</form>
	
	<!-- ********************************************************* -->

          <footer class="text-right">
            

          </footer>         
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script src="info/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="info/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script>

      google.load('visualization', '1.0', {'packages':['corechart']});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]);
          var options = {'title':'How Much Pizza I Ate Last Night'};
          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
          pieChart.draw(data, options);
          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
          barChart.draw(data, options);
      }

      $(document).ready(function(){
        if($.browser.mozilla) {
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false);
            }, 200);
          });      
        } else {
          $(window).resize(function(){
            drawChart();
          });  
        }   
      });
      
    </script>
    <script type="text/javascript" src="info/js/templatemo-script.js"></script><p>版权所有 &copy; 2017 Mars Mobile Shop中国商务公司</p>      <!-- Templatemo Script -->
	
  </body>
  
  
</html>