package wai.api.verifyPerson;

import java.util.Iterator;
import java.util.List;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import JavaBiometric.CMain;

import database.connectToDb;
import database.connectToDbOfficial;

/**
 * Servlet implementation class VerifyPerson
 */
public class VerifyPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static connectToDb connectToDB;
	private static Connection WAIConnection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			connectToDB=new connectToDb();
			WAIConnection=connectToDB.dbconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		if(WAIConnection!=null){
			try{
				WAIConnection.close();
			}catch(SQLException s){
				//do nothing
				s.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			PrintWriter out=response.getWriter();
			String uid=null;
			String hand=request.getParameter("hand");
			String finger=request.getParameter("finger");			
			boolean isMultipart=ServletFileUpload.isMultipartContent(request);
			if(isMultipart){
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List items = upload.parseRequest(request);
				Iterator iter = items.iterator();
				InputStream stream=null;
				while(iter.hasNext()){
					FileItem item = (FileItem) iter.next();
					if(!item.isFormField()){
						stream=item.getInputStream();
						System.out.println(stream);
					}
					else{
						String itemName=item.getFieldName();
						System.out.println(itemName+item.getString());
						if(itemName.equals("UID"))
							uid=item.getString();
						else if(itemName.equals("hand"))
							hand=item.getString();
						else if(itemName.equals("finger"))
							finger=item.getString();
					}
				}
				String basePath=request.getRealPath("/");
				String fullPath1=basePath+"image1.jpg";
				System.out.println(fullPath1);
				OutputStream imageOut = new FileOutputStream(new File(fullPath1));
				int read = 0;
				byte[] b = new byte[1024];
				while ((read = stream.read(b)) != -1) {
					imageOut.write(b, 0, read);
				}
				stream.close();
				imageOut.flush();
				imageOut.close();
				System.out.println(imageOut);
				System.out.println(uid+" "+hand+" "+finger);
				String fp="FP0";
				if(hand.equals("rightHand"))
				{
					if(finger.equals("thumb"))
						fp="FP0";
					else if(finger.equals("indexFinger"))
						fp="FP1";
					else if(finger.equals("middleFinger"))
						fp="FP2";
					else if(finger.equals("ringFinger"))
						fp="FP3";
					else if(finger.equals("littleFinger"))
						fp="FP4";
					
				}
	
				else if(hand.equals("leftHand"))
				{
					if(finger.equals("thumb"))
						fp="FP5";
					else if(finger.equals("indexFinger"))
						fp="FP6";
					else if(finger.equals("middleFinger"))
						fp="FP7";
					else if(finger.equals("ringFinger"))
						fp="FP8";
					else if(finger.equals("littleFinger"))
						fp="FP9";
					
				}
				Blob image = null;
				byte[ ] imgData = null ;
				String QueryString = "SELECT "+fp+" FROM db2admin.NOMINAL_ROLL,db2admin.IDENTIFICATION WHERE db2admin.NOMINAL_ROLL.UID=db2admin.IDENTIFICATION.UID AND db2admin.NOMINAL_ROLL.UID=?";
				System.out.println(QueryString);
				PreparedStatement statement= WAIConnection.prepareStatement(QueryString);
				statement.setString(1,uid);
				ResultSet rs = statement.executeQuery();
				String fullPath2=basePath+"image2.jpg";
				if(rs.next()){
					System.out.println("In here2");
					image = rs.getBlob(fp);
					imgData = image.getBytes(1,(int)image.length());
					OutputStream o=new FileOutputStream(fullPath2);				
					o.write(imgData);
					o.flush();
					o.close(); 
				}
				
				CMain compare = new CMain();
				int value = compare.start(fullPath1, fullPath2);
				if(value>95){
					out.write("Validated");
				}else{
					out.write("Invalid");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
