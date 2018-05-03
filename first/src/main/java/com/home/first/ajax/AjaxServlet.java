package com.home.first.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;     

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 responseAjax(request,response);
	 }
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 responseAjax(request,response);
	 }
	 private void responseAjax(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 String name = (String)request.getParameter("name");
		 PrintWriter out = response.getWriter();
		 out.print("<h1>" + name + "</h1>");
	 }
}
