<%@page import="workspace.GetPath"%>
<%@ page import="gdk.*" %> 
<%
if(session.getAttribute("userid")==null)
{
   response.sendRedirect("../login/loginError.jsp");
}
%>
<%
	String content=request.getParameter("content");
	fileIO f=new fileIO();
	String fullPath=request.getRealPath("/");
	String uri = request.getRequestURI();
	GetPath getpath = new GetPath();
	String workspacePath=getpath.returnPath(fullPath,uri);
	System.out.print(fullPath+" "+workspacePath);
	f.writer(content, workspacePath+"\\news.txt");
	out.println("News posted Successfully!");
%>