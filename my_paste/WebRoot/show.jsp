<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*" %>
<% 
 int id=Integer.valueOf(request.getParameter("id"));
 BufferedReader br=new BufferedReader(new FileReader("/home/ubuntu/my_paste/"+id));
 String content="";
 String temp="";
 while((temp=br.readLine())!=null)
 {
 content=content+temp;
  }
 br.close();
%>
<html>
  <head>
    <title>展示页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
.first{
color:#A2F
}
.second{
color:#B44
}
.third{
color:#B8860B
}
</style>
</head>
<body>
  <h1><p class="text-center text-primary">我们自己的代码分享工具</p></h1>
  <div class="well well-lg">
  <%= content %>
  </div>
  </body>
</html>
