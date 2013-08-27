<%@page import = "java.util.Date" session="true"%>
<%

  session.setAttribute("user", null);
  session.setAttribute("eid", null);
  session.invalidate();
  response.sendRedirect("login.jsp");
%>