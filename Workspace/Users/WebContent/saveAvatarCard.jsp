<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="reports.*" %>
<%@ page import="waicard.*" %>
<%@ page import="java.io.*" %>
<%@ page import="net.glxn.qrgen.QRCode" %>
<%@ page import="net.glxn.qrgen.image.ImageType" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null)
{
	session.setAttribute("errorToShowOnLoginPage","Please Log In To Continue");
	String uri = request.getRequestURI();
	session.setAttribute("redirectTo", uri);
	response.sendRedirect("indexnews.jsp");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	QRCheckSum qr=new QRCheckSum();
	String qrtext=qr.getQRString(session.getAttribute( "userid").toString());
	ByteArrayOutputStream out1 = QRCode.from(qrtext).to(
			ImageType.PNG).stream();
	
	OutputStream outStream = new FileOutputStream(new File(request.getRealPath("/")+"qrcode.png"));
	//OutputStream outStream = response.getOutputStream();

	outStream.write(out1.toByteArray());

	outStream.flush();
	outStream.close();

	AvatarCard rep=new AvatarCard();
    rep.generateCard(session.getAttribute( "userid").toString(),request.getRealPath("/").toString(),request.getRealPath("/")+"photo.png",request.getRealPath("/")+"qrcode.png");
%>
<jsp:forward page="avatarcard.pdf"></jsp:forward>
</body>
</html>