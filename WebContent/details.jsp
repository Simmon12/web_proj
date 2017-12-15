<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  	request.setCharacterEncoding("utf-8");
	boolean b = connect();
	List<Map<String,String>> list = queryMovie("2",2);
	String moviename = "";
	String moviedirector = "";
	String moviestarring = "";
	String movieyear = "";
	String movieclass = "";
	String movieinfo = "";
	if(list != null){
		Map<String,String> map = list.get(0);
		moviename += map.get("name");
		moviedirector += map.get("director");
		moviestarring += map.get("starring");
		movieyear += map.get("year");
		movieclass += map.get("classes");
		movieinfo += map.get("info");
	}
	else {
		moviename = "null";
		moviedirector = "null";
		moviestarring = "null";
		movieyear = "null";
		movieclass = "null";
		movieinfo = "null";
	}
	
	String editstr = "编辑内容";
	String isChange = "false";
	
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		if(isChange.equals("false")){
			editstr = "修改完成";
			isChange = "true";
		}
		else{
			isChange = "false";
		}
	}
%>
<!DOCTYPE HTML>
<html>
<head>
  <title>详情</title>
  <link rel="stylesheet" type="text/css" href="public/css/index.css">
  <link rel="stylesheet" type="text/css" href="public/css/reset.css">
  <link rel="stylesheet" type="text/css" href="public/css/details.css">
  <script type="text/javascript" src="public/js/details.js"></script>
</head>
<body>
  <!-- 向js文件传递信息 -->
  <input type = "hidden" id="tag" value="<%= isChange%>"> 
  <!--导航栏-->
  <div class="nav-wrapper">
    <div class="nav-content">
      <img class="logo" src="public/image/hdmovie_32.png">
      <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="#">关于我们</a></li>
      </ul>
      <div class="login_register">
        <span class="btn_login"><a id="btn_login">登录</a></span>
        <span style="color: white">&nbsp;|</span><span class="btn_regis"><a id="btn_regis">注册</a></span>
      </div>
    </div>
  </div>
  
  <!-- 影片详情 -->
  <div class="detail">
  	<p><span id="moviename"><%= moviename %> </span>
  	<form action="details.jsp" method="post">
  	<input id="shortcomment" type="submit" name="submit1" value=<%= editstr%>>
  	</form>
  	<span><img id="editicon" src="public/image/editicon.png"></span>
  	<p id="moviepic"><img class="poster" src="public/image/flipped.jpeg"></p>
  	<div id="movieinfo">
  	<p>导演：<input id="director" type="text" value=<%= moviedirector%> readonly="true"></p><br>
  	<p>主演：<input id="starring" type="text" value=<%= moviestarring%> readonly="true"></p><br>
  	<p>上映年份：<input id="year" type="text" value=<%= movieyear%> readonly="true"></p><br>
  	<p>类别：<input id="movieclass" type="text" value=<%= movieclass%> readonly="true"></p><br>
  	</div>
  </div>
  
  <div id="plot">剧情简介：<br><textarea id="movieplot" type="text" readonly="true"><%= movieinfo%></textarea></div>
  
  <div class="newcomment">
  	 <div class = "newcommentsize">
	  	 <label class="com">请写下你的观影感受吧~</label><br>
	     <textarea type="text" name="new-comment" id="my-comment"><%= isChange%></textarea><br>
	     <button id="comment-sub">提交</button>
  	 </div>
  </div><br>
  
  <div class="somecomments">
  		<p id="comtitle">怦然心动的短评</p>
  </div>
 
  <!--footer-->
  <div class="footer-wrapper">
    <div class="bottom-footer">
        <p>Copyright © 2017 Movie. All Rights Reserved. </p>
    </div>
  </div>
  <!--登陆框-->
  <div class="ui-mask" id="mask" onselectstart="return false"></div>
  <div class="ui-dialog " id="dialog-Login" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      登陆通行证
      <a class="ui-dialog-closebutton"  id="close_login"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" name="username" type="input" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" name="password" type="input" placeholder="密码">
      </div>
      <div>
        <a class="ui-dialog-submit" href="details.jsp">登录</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_regist">立即注册</a>
      </div>
    </div>
  </div>

  <!--注册框-->
  <div class="ui-dialog " id="dialog-register" onselectstart='return false;'>
    <div class="ui-dialog-title" onselectstart="return false;">
      注册账号
      <a class="ui-dialog-closebutton" id="close_regist"></a>
    </div>
    <div class="ui-dialog-content">
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-username" name="username" type="input" placeholder="用户名">
      </div>
      <div class="ui-dialog-40 ui-dialog-pt15">
        <input class="ui-dialog-input ui-dialog-input-password" name="password" type="input" placeholder="密码">
      </div>
      <div>
        <a class="ui-dialog-submit" href="details.jsp">注册</a>
      </div>
      <div class="ui-dialog-40">
        <a href="#" id="jump_to_login">立即登录</a>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="public/js/details.js"></script>
</body>
</html>

<%@ include file="DB.jsp" %>
