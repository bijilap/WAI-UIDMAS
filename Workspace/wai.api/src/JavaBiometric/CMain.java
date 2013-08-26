package JavaBiometric; 
 

import java.io.File;
import java.io.*;

public class CMain {

  public CMain() {}


  public int start(String path1, String path2)
  {
	  
	 //System.out.println(new java.io.File("").getAbsolutePath()+"\\ProcessedSample2.bmp");
	BufferedReader in= new BufferedReader(new InputStreamReader(System.in));
    CEntityForm classFormMain = new CEntityForm(path1,path2);
     //CEntityForm classFormMain = new CEntityForm();
    //classFormMain.setSize(800,800);
     return classFormMain.result();
    //classFormMain.setVisible(true);

  }
}