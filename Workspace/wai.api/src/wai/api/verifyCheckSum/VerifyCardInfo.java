package wai.api.verifyCheckSum;


import wai.api.verifyCheckSum.*;
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

import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.FileImageOutputStream;
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
import org.apache.commons.io.output.WriterOutputStream;

import JavaBiometric.CMain;

import database.connectToDb;
import database.connectToDbOfficial;

/**
 * Servlet implementation class VerifyPerson
 */
public class VerifyCardInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static connectToDb connectToDB;
	private static Connection WAIConnection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyCardInfo() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			String uid=request.getParameter("uid");
			String fname=request.getParameter("fname");
			String mname=request.getParameter("mname");		
			String lname=request.getParameter("lname");	
			String dob=request.getParameter("dob");	
			String checksum=request.getParameter("checksum");
			
			out.println("<html><body>");
			
			GetCardCheckSum gccs=new GetCardCheckSum();
			String readCard=gccs.calCheckSumfromInfo(uid, fname, mname, lname, dob);
			if(checksum.equals(readCard))
			{
				out.println("Step 1: Verified. Checksum is valid");
				String orginalCard=gccs.calCheckSum(uid);
				if(checksum.equals(orginalCard))
				{
					out.println("<p>Step 2: Succeeded. Information on card is valid.</p>");
					out.println("<p>Step 3: Manual Photo Verification</p>");
					out.println("<img src='RealCardPic?uid="+uid+"'></img>");
				}
				else
				{
					out.println("<p>Step 2: Failed. Information on card has been tampered with.</p>");
				}
			}
			else
			{
				out.println("<p>Step 1: Failed! Information on card is wrong</p>");
			}
			out.println("</html></body>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
