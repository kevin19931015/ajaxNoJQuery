<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>json练习</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <select id="province" name="province">
       <option value="">请选择....</option>
     </select>
	 <select id="city" name="city">
	 	<option value="">请选择.....</option>
	 </select>
	 <script type="text/javascript">
	 window.onload=function(){
		 var xhr = createXmlHttpRequest();
		 xhr.onreadystatechange=function(){
			 if(xhr.readyState==4){
				 if(xhr.status==200||xhr.status==304){
					 var data = xhr.responseText;
					 var ProvinceData = eval("("+data+")");
					 for(var i=0;i<ProvinceData.length;i++){
						 var optionElement = document.createElement("option");
						 optionElement.setAttribute("value",ProvinceData[i].name);
						 var nodeText = document.createTextNode(ProvinceData[i].name);
						 optionElement.appendChild(nodeText);
						 document.getElementById("province").appendChild(optionElement);
					 }
				 }
			 }
		 }
		 xhr.open("GET","/ajaxday01/servlet/Servlet5");
		 xhr.send(null);
	 }
	 function createXmlHttpRequest(){
		   var xmlHttp;
		   try{    //Firefox, Opera 8.0+, Safari
				   xmlHttp=new XMLHttpRequest();
			}catch (e){
				   try{    //Internet Explorer
						  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
					}catch (e){
						  try{
								  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
						  }catch (e){}  
				   }
			}
		   return xmlHttp;
		 }
	 </script>
  </body>
</html>
