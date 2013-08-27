<%@page import = "java.util.Date" session="true"%>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma","no-cache");
	if(session.getAttribute("userid")==null){
		session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
		response.sendRedirect("logIn.jsp");
	}
	session.setAttribute("user", null);
	session.invalidate();
	response.sendRedirect("logIn.jsp");
%>