package configuration;

import java.io.BufferedReader;
import java.io.FileReader;

public class Configuration {
	private StringBuffer fileContents=new StringBuffer();
	
	public Configuration(String realPath){
		try {
			BufferedReader br=null;
			String filePath=realPath+"Admin/configuration.txt";
			br=new BufferedReader(new FileReader(filePath));
			String currentLine=null;			
			while((currentLine=br.readLine())!=null){
				fileContents=fileContents.append(currentLine);
			}
			System.out.println(fileContents);
		} catch (Exception e) {
			//do nothing
		}
	}
	
	public String getBackupRestorePath(){
		
		String backupRestoreOpenTag="<backup-restore-path>";
		String backupRestoreCloseTag="</backup-restore-path>";
		String backupRestorePath=null;
		if(fileContents!=null){
			backupRestorePath=fileContents.substring(fileContents.indexOf(backupRestoreOpenTag)+backupRestoreOpenTag.length(),fileContents.indexOf(backupRestoreCloseTag));
			backupRestorePath=backupRestorePath.trim();
			System.out.println(backupRestorePath);
		}
		return backupRestorePath;
	}

}
