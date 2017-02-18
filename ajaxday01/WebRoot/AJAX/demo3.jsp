<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证用户名是否存在</title>
    
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
    <form>
    <table border="1">
    <tr>
    <td>用户名</td>
    <td>
    <input type="text" name="username" id="username" value=""/>
    <input type="button" name="b1" id="b1" value="检查用户名是否可用"/>
    </td>
    </tr>
    </table>
    <div id="checkname"></div>
    </form>
    <script type="text/javascript">
    window.onload=function(){//当页面被加载完时执行
    	document.getElementById("b1").onclick=function(){
    	//得到XmlHttpRequest
    	var xhr = createXmlHttpRequest();
    		//建立服务器连接，初始化XmlHttpRequest对象
        	xhr.open("POST","/ajaxday01/servlet/Servlet3");
    		//设置post提交数据头
    		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        	//发送数据
        	var username = document.getElementById("username").value;
        	xhr.send("username="+username);
        	//状态变化的回调函数
        	xhr.onreadystatechange=function(){
        		//状态4为完成
        		if(xhr.readyState==4){
        			//服务器状态正常
        			if(xhr.status==200||xhr.status==304){
        				document.getElementById("checkname").innerHTML=xhr.responseText;
        				}
        			}
    		    }
    	}
    }
    function createXmlHttpRequest(){
    	var xmlHttp;
    	try{
    		xmlHttp = new XMLHttpRequest();
    	}catch(e){
    		try{
        		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    		}catch(e){
    			try{
            		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        		}catch(e){
        		}
    		}
    	}
    	return xmlHttp;
    }
    </script>
  </body>
</html>
