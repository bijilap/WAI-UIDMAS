package gdk;
import java.io.*;
public class fileIO 
{
 public void writer(String content, String path)
  {
  try{
  // Create file 
  path=path+"news.txt";
  FileWriter fstream = new FileWriter(path);
  BufferedWriter out = new BufferedWriter(fstream);
  out.write(content);
  //Close the output stream
  out.close();
  }
  catch (Exception e){//Catch exception if any
  System.err.println("Error: " + e.getMessage());
  }
  }
 public String reader(String path) {
	    path=path+"news.txt";
	    File file = new File(path);
	    int ch;
	    StringBuffer strContent = new StringBuffer("");
	    FileInputStream fin = null;
	    try {
	      fin = new FileInputStream(file);
	      while ((ch = fin.read()) != -1)
	        strContent.append((char) ch);
	      fin.close();
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    return (strContent.toString());
	  }
 
}