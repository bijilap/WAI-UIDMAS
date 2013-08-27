package reports;

import database.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
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

public class AvatarCard

{
public static void generateCard(String uid, String path, String imagePath,String qrcPath)
{

try
{
connectToDb Con=new connectToDb();
Connection con=Con.dbconnect();
Statement stmt = null;
ResultSet rset = null;
String queryString = "SELECT CONCAT( CONCAT(FNAME,' '),CONCAT(CONCAT(MNAME,' '),LNAME)) AS NAME, DOB,AGE,GENDER,ADDRESS,UID,'"+imagePath+"' AS IMAGE,'"+qrcPath+"' AS QRCODE FROM DB2ADMIN.NOMINAL_ROLL WHERE UID='"+uid+"'";
System.out.println(queryString);

stmt = con.createStatement();
rset = stmt.executeQuery(queryString);
InputStream input = new FileInputStream(new File(path+"avatarcard.jrxml"));
JasperDesign design = JRXmlLoader.load(input);
JasperReport report = JasperCompileManager.compileReport(design);
JRResultSetDataSource jasperReports = new JRResultSetDataSource(rset);
JasperPrint print = JasperFillManager.fillReport(report, new HashMap(), jasperReports);


long start = System.currentTimeMillis();

OutputStream output = new FileOutputStream(new File(path+"avatarcard.pdf"));
JasperExportManager.exportReportToPdfStream(print, output);
}
catch(Exception e)
{
	e.printStackTrace();
}
}
}