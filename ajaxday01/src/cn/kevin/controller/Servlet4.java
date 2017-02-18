package cn.kevin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;


@WebServlet("/servlet/Servlet4")
public class Servlet4 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException{
		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			String path = getServletContext().getRealPath("/AJAX/city.xml");
			SAXReader reader = new SAXReader();
			Document document = reader.read(path);
			String xmlText = document.asXML();
			out.write(xmlText);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
