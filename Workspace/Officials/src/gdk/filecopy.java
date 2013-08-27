package gdk;
import java.io.*;
public class filecopy
{
public void copyfile(String srFile, String dtFile)
{
	System.out.println(this.getClass().getName() + " is loaded from " +
			getClass().getProtectionDomain().getCodeSource().getLocation());
  try
  {
      File f1 = new File(srFile);
      File f2 = new File(dtFile);
      InputStream in = new FileInputStream(f1);
      OutputStream out = new FileOutputStream(f2);
      byte[] buf = new byte[1024];
      int len;
      while ((len = in.read(buf)) > 0)
      {
          out.write(buf, 0, len);
      }
      in.close();
      out.close();
      System.out.println("File copied.");
  }
  catch(FileNotFoundException ex)
  {
      System.out.println(ex.getMessage() + " in the specified directory.");
      System.exit(0);
  }
  catch(IOException e)
  {
      System.out.println(e.getMessage());  
  }
}
}
