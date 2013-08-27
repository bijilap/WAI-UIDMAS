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
import java.lang.*;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

public class Report

{
public  void userLogin(String uid, String path)
{

try
{
connectToDb Con=new connectToDb();
Connection con=Con.dbconnect();
Statement stmt = null;
ResultSet rset = null;
String queryString = "SELECT FNAME,UID,PASSWORD "
+ "FROM db2admin.NOMINAL_ROLL WHERE UID='"+uid+"'";
stmt = con.createStatement();
rset = stmt.executeQuery(queryString);
InputStream input = new FileInputStream(new File(path+"userlogin.jrxml"));
//System.out.println("Here");
JasperDesign design = JRXmlLoader.load(input);
//System.out.println("Here2");
JasperReport report = JasperCompileManager.compileReport(design);
JRResultSetDataSource jasperReports = new JRResultSetDataSource(rset);
JasperPrint print = JasperFillManager.fillReport(report, new HashMap(), jasperReports);


long start = System.currentTimeMillis();

OutputStream output = new FileOutputStream(new File(path+"userlogin.pdf"));
JasperExportManager.exportReportToPdfStream(print, output);
}
catch(Exception e)
{
	e.printStackTrace();
}
}
}