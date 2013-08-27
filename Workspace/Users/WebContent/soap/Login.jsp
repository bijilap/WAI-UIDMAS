<%@ include file='constants.jsp' %>  
<%@ page import="com.paypal.sdk.profiles.APIProfile" %>
<%@ page import="com.paypal.sdk.profiles.ProfileFactory" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<jsp:useBean id="caller" scope="session" class="com.paypal.sdk.services.CallerServices" />

<%	
	
	
	try {
		APIProfile profile = null;
				
		Hashtable pars = new Hashtable();
		if (FileUpload.isMultipartContent(request)) {
			DiskFileUpload upload = new DiskFileUpload();

			// Parse the request
			List items = upload.parseRequest(request);
	
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();

				if (item.isFormField()) {
					pars.put(item.getFieldName(), item.getString());
					
				} else {
					if ((item.getName() != null) && (item.getName().length() > 0)) {
						File cfile = new File(item.getName()); 
						File tosave = new File(getServletContext().getRealPath("/cert/"),cfile.getName());
						item.write(tosave);
						pars.put("certificateFile", tosave.getAbsolutePath());
					}
				}
			}
		}
		
	        String unipay = (String)pars.get("subjectEmail");
	        
		 if(true){
			System.out.println((String) pars.get("apiUsername"));
			System.out.println((String) pars.get("apiPassword"));
			System.out.println((String) pars.get("signature"));
			System.out.println((String) pars.get("environment"));
			
			profile = ProfileFactory.createSignatureAPIProfile();
			profile.setAPIUsername((String) pars.get("apiUsername"));
			profile.setAPIPassword((String) pars.get("apiPassword"));
			profile.setSignature((String) pars.get("signature"));
			profile.setEnvironment((String)pars.get("environment"));
			profile.setSubject((String) pars.get("subjectEmail"));
			session.setAttribute("environment",(String)pars.get("environment"));
			
			
			
			/*profile = ProfileFactory.createSignatureAPIProfile();
			profile.setAPIUsername("harsha_1331567108_biz_api1.gmail.com");
			profile.setAPIPassword("1331567132");
			profile.setSignature("A7ABp2MmAvJRLZieLCwcdVTwmWqdAOv0ZXpxG9un4kgaeb8knC1aLaMO");
			profile.setEnvironment("sandbox");
			profile.setSubject("Pay test bills");
			session.setAttribute("environment","sandbox");*/
		}
	caller.setAPIProfile(profile);
    	session.setAttribute("caller", caller);
    	response.sendRedirect("ExpressCheckout.jsp?paymentType=Sale");
	} catch (Exception e) {
		session.setAttribute("exception", e);
		response.sendRedirect("Error.jsp");
	}
%>

