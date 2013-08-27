package reports;

import database.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import java.io.*;


import org.apache.commons.digester.*;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

public class Acknwlgmnt

{
public static void generateCard(String regno, String auth, String path)
{

try
{
connectToDb Con=new connectToDb();
Connection con=Con.dbconnect();
Blob image = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rset = null;
String queryString;
queryString = "SELECT PHOTO FROM DB2ADMIN.REG_FORM WHERE REG_NO='"+regno+"' AND MODERATOR_ID='"+auth+"'";
stmt=con.createStatement();
rset= stmt.executeQuery(queryString);
if(rset.next())
{
	image = rset.getBlob("PHOTO");
	imgData = image.getBytes(1,(int)image.length());
	OutputStream o=new FileOutputStream(path+"photo.png");
	o.write(imgData);
	o.flush();
	o.close(); 
}

queryString = "SELECT CONCAT( CONCAT(FNAME,' '),CONCAT(CONCAT(MNAME,' '),LNAME)) AS NAME, DOB,AGE,GENDER,R_ADDR,REG_NO,DOR,MODERATOR_ID,PHOTO,'"+path+"photo.png' AS IMAGE FROM DB2ADMIN.REG_FORM WHERE REG_NO='"+regno+"' AND MODERATOR_ID='"+auth+"'";
stmt = con.createStatement();
rset = stmt.executeQuery(queryString);
InputStream input = new FileInputStream(new File(path+"acknldgmnt.jrxml"));
System.out.println("Here");
JasperDesign design = JRXmlLoader.load(input);
System.out.println("Here");
JasperReport report = JasperCompileManager.compileReport(design);
JRResultSetDataSource jasperReports = new JRResultSetDataSource(rset);
JasperPrint print = JasperFillManager.fillReport(report, new HashMap(), jasperReports);


long start = System.currentTimeMillis();

OutputStream output = new FileOutputStream(new File(path+"acknldgmnt.pdf"));
JasperExportManager.exportReportToPdfStream(print, output);
}
catch(Exception e)
{
	e.printStackTrace();
	System.out.println(e);
}
}
}