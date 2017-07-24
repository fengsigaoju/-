<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.po.translate" %>
<!-- 获得前台用户提交代码，并生成自增id，存储代码，跳转到show.jsp+id -->
<% request.setCharacterEncoding("utf-8");
   String code=null;
   String name=null;
   int num=0;
   Enumeration enu=request.getParameterNames();
   List<String>arraylistA=new ArrayList<String>();
   List<String>arraylistB=new ArrayList<String>();
   List<Map<String,String>>list=new ArrayList<Map<String,String>>();
   while(enu.hasMoreElements()){  
   String paraName=(String)enu.nextElement();  
   if (paraName.trim().equals("code"))
   {
   code=request.getParameter("code");//获取代码
   out.println(code);
   }
   else if (paraName.trim().equals("name"))
   name=request.getParameter("name");
   else
   {
    num++;
    if (num%2==1){
    arraylistA.add(request.getParameter(paraName));//用来存储用户的规则
    }
   else
    arraylistB.add(request.getParameter(paraName));//用来存储用户每条规则的对应颜色
  }
  }
   translate t=new translate();
   t.addrule(arraylistA,arraylistB);
   out.println(list);
   Integer i=(Integer)application.getAttribute("cal");
   if (i==null){
   i=0;
   application.setAttribute("cal",1);
   }
   else
   {
   application.setAttribute("cal",Integer.valueOf(i+1));
   }
   PrintWriter pw=new PrintWriter("/home/ubuntu/my_paste/"+i);
   pw.write(t.solve_annotation(code));
   pw.close();
   response.sendRedirect("show.jsp?id="+i);
%>
