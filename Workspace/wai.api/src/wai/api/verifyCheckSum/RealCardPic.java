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
public class RealCardPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static connectToDb connectToDB;
	private static Connection WAIConnection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealCardPic() {
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
		try
		{
			response.setContentType("image/png");
			String uid=request.getParameter("uid");
			Connection con=connectToDB.dbconnect();
			String  query="SELECT PHOTO FROM DB2ADMIN.IDENTIFICATION WHERE UID=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, uid);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				Blob image =  rs.getBlob("PHOTO");
				byte[ ] imgData = image.getBytes(1,(int)image.length());
				OutputStream outStream = response.getOutputStream();
				outStream.write(imgData);
				outStream.flush();
				outStream.close();
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
