<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>省市联动</title>
    
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
    <select id="province" name="province" onchange="getCity(this.value)">
    	<option value="">请选择</option>
    </select>
    <select id="city" name="city" >
    	<option value="">请选择</option>
    </select>
  </body>
  <script type="text/javascript">
  window.onload=function(){
	  var xhr = createXmlHttpRequest();
	  xhr.onreadystatechange=function(){
		  if(xhr.readyState==4){
			  if(xhr.status==200||xhr.status==304){
				  var xmlDoc = xhr.responseXML;
				  //添加省
				  var xmlProvinceElement = xmlDoc.getElementsByTagName("province");
				  for(var i=0;i<xmlProvinceElement.length;i++){
					  var optionElement = document.createElement("option");
					  optionElement.setAttribute("value", xmlProvinceElement[i].getAttribute("name"));
					  var textNode = document.createTextNode(xmlProvinceElement[i].getAttribute("name"));
					  optionElement.appendChild(textNode);
					  document.getElementById("province").appendChild(optionElement);
				  }
			  }
		  }
	  }
	  xhr.open("GET","/ajaxday01/servlet/Servlet4");
	  xhr.send(null);
  }
  function fresh(){
	  var cities = document.getElementById("city");
	  var childs = cities.childNodes;
	  alert(cities.length);
	  alert(childs.length);
	  if(childs.length>3){
		  for(var i=3;i<childs.length-1;i=i+2){
			  cities.removeChild(childs[i]);
		  }
	  }
  }
  function getCity(value){
	  fresh();
	  var xhr = createXmlHttpRequest();
	  xhr.onreadystatechange=function(){
		  if(xhr.readyState==4){
			  if(xhr.status==200||xhr.status==304){
				  var xmlDoc = xhr.responseXML;
				  var province = value;
				  //var province = document.getElementById("province").value;
				  var xmlProvinceElements = xmlDoc.getElementById(province);
				  //添加市
				  var xmlCityElement = xmlProvinceElements.getElementsByTagName("city");
				  
				  for(var i=0;i<xmlCityElement.length;i++){
					  var optionElement = document.createElement("option");
					  optionElement.setAttribute("value", xmlCityElement[i].childNodes[0].nodeValue);
					  var textNode = document.createTextNode(xmlCityElement[i].childNodes[0].nodeValue);
					  optionElement.appendChild(textNode);
					  document.getElementById("city").appendChild(optionElement);
				  }
			  }
		  }
	  }
	  xhr.open("GET","/ajaxday01/servlet/Servlet4");
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
</html>
