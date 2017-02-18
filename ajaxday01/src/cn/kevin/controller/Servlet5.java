package cn.kevin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

import cn.kevin.domain.Province;


@WebServlet("/servlet/Servlet5")
public class Servlet5 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException{
		List<Province> pc = new ArrayList<Province>();
		pc.add(new Province("江苏","123"));
		pc.add(new Province("山东","123"));
		pc.add(new Province("浙江","123"));
		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		JsonConfig jsonCfg = new JsonConfig();
		jsonCfg.setExcludes(new String[] {"zipcode"});
		JSONArray jsonArray = JSONArray.fromObject(pc,jsonCfg);
		System.out.println(jsonArray.toString());
		out.write(jsonArray.toString());
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
