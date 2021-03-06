<%@page import="system.bean.Userinfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="system.bean.Address" %>
<%@ page import="system.bean.Userinfo" %>
<%@ page import="system.dao.impl.AddressDAOImpl" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>信息管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href="info/css/font-awesome.min.css" rel="stylesheet">
    <link href="info/css/bootstrap.min.css" rel="stylesheet">
    <link href="info/css/templatemo-style.css" rel="stylesheet">
  </head>
  <body>  
  		<%
  		if(session.getAttribute("addressHiht")==null){
  			
  		}else if(session.getAttribute("addressHiht").equals("修改地址信息成功成功")){
  		%>
  		 <script language="javascript"> //JavaScript脚本标注
  			alert("修改地址信息成功");
		 </script>
  		<%
  		session.removeAttribute("addressHiht");
  		}	
%>
  
  
  
<% 		
     AddressDAOImpl addressDAOImpl = new AddressDAOImpl(); 
     Userinfo user = (Userinfo) session.getAttribute("Userinfo");
     %>
  	<%int count = addressDAOImpl.getAddrCount(user.getUsername());
    %>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <%
            if(user.getPower()==0){
           %>
           		<h1>当前登录:AdMIN</h1>
           <%
            } else {
           %>
           <h1>当前登录:<%=user.getUsername() %></h1>
           <%
            }
           %>
          
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
          <%
             if(user.getPower()==0){
             %>
             	<!-- 管理员的菜单栏 -->
             	<li><a href="manageUserInfo.jsp"  class="active"><i class="fa fa-bar-chart fa-fw"></i>用户信息管理</a></li>
            	<li><a href="manageUserInfo.jsp"><i class="fa fa-database fa-fw"></i>商品信息管理</a></li>
            	<li><a href="manageUserInfo.jsp"><i class="fa fa-map-marker fa-fw"></i>销售管理</a></li>
            	<li><a href="modifyAdministorPassword.jsp"><i class="fa fa-users fa-fw"></i>修改密码</a></li>
            	<li><a href="playAllOrders.jsp"><i class="fa fa-sliders fa-fw"></i>查看所有订单</a></li>
            	<li><a href="tuichu.jsp"><i class="fa fa-eject fa-fw"></i>退出登录</a></li>
             <%}else{%>
            	 <!-- 普通用户的菜单栏 -->
            	<li><a href="manageUserInfo.jsp"  class="active"><i class="fa fa-bar-chart fa-fw"></i>地址管理</a></li>
            	<li><a href="manageUserInfo.jsp"><i class="fa fa-database fa-fw"></i>查看订单</a></li>
            	<li><a href="manageUserInfo.jsp"><i class="fa fa-map-marker fa-fw"></i>购物车管理</a></li>
           	 	<li><a href="modifyUserPassword1.jsp"><i class="fa fa-users fa-fw"></i>修改密码</a></li>
            	<li><a href="tuichu.jsp"><i class="fa fa-sliders fa-fw"></i>退出登录</a></li>
            	<li><a href="index.jsp"><i class="fa fa-eject fa-fw"></i>商城首页</a></li>
			<%}%>          
          </ul>  
        </nav>
      </div>
           <!-- Main content -->
   <div class="templatemo-content col-1 light-gray-bg">
	
	<br>
	<h1>共查到<%=count %>条记录</h1>
	<br><br><div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<blockquote>
				<p>添加收货地址的时候，请注意： </p>
				<p>1、 收货人姓名和详细地址：需真实有效  </p>
				<p>2、 联系方式：建议填写手机，以便及时联系  </p>
				<p>3、 详细地址：一定要填写正确并且详细，所在地区的省市县，如果找不到所在地区，请选择所在地区的上一级县市 
				<p><i style="color:red;">注:每个人可以最多可以添加五条地址信息</i>
				</p> <small>关键词 <cite>收货地址</cite></small>
			</blockquote>
		</div>
	</div>
	</div>

	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>
							序号
						</th>
						<th>
							收货人姓名
						</th>
						<th>
							邮编
						</th>
						<th>
							详情地址
						</th>
						<th>
							电话号码
						</th>
						<th>
							管理
						</th>
					</tr>
				</thead>
				<tbody>
					<%	    
						int addrCount=1;
						List<Address> allAddrInfo = addressDAOImpl.getAllInfoByUser(user.getUsername());
						if(count==0){
						%>
							<tr class="success">
							
							<td colspan="6">
								<center><a href="addAddrInfo.jsp">你还没有添加你的收货地址,点击添加</a></center>
	
							</td>
					</tr>
						
						
						
						<%
						}else {
						
						for (Address address : allAddrInfo) {
						 %>
					<tr class="success">
						<td>
							<%=addrCount++ %>
						</td>
						<td>
							<%=address.getA_name() %>
						</td>
						<td>
							<%=address.getA_mail()%>
						</td>
						<td>
							<%=address.getA_address() %>
						</td>
						<td>
							<%=address.getA_phone() %>
						</td>
						<td>
							<a href="updataAddr.jsp?id=<%=address.getA_id()%>">编辑</a>
							<a onclick="del(<%=address.getA_id()%>)">删除</a>
						</td>
					</tr>
					<%
						}
						if(count<5){
						%>
						<tr class="success">
							<td colspan="6">
								<center><a href="addAddrInfo.jsp">点击添加新的地址</a></center>
	
							</td>
						</tr>
							<%
						}
					}
					%>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
	<!-- ********************************************************* -->

          <footer class="text-right">
            <p>版权所有 &copy; 2017 Mars Mobile Shop中国商务公司</p>

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
    <script type="text/javascript" src="info/js/templatemo-script.js"></script>      <!-- Templatemo Script -->
	
  </body>
  
  <script type="text/javascript">
  function del(id){
	  if(confirm("你确定要删除该行吗？")){
		//页面跳转
		window.location.href="addrDelete_deal.jsp?id="+id;
	  }
  }
  
  </script>
</html>
