package workspace;

public class GetPath {
	
	public String returnPath(String fullPath , String currentUri){
		String uri = currentUri;
		int firstLocationOfBackslash=uri.indexOf("/");
		int secondLocationOfBackslash=uri.indexOf("/", firstLocationOfBackslash+1);
		uri=uri.substring(firstLocationOfBackslash+1, secondLocationOfBackslash);
		System.out.println(uri);
		String workspacePath;
		String pathPresentInEclipse="\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\"+uri+"\\";
		int locationOfFirstDot=fullPath.indexOf(pathPresentInEclipse);
//		System.out.println(fullPath.length() + "  " + (locationOfFirstDot+(pathPresentInEclipse.length())));
		if(locationOfFirstDot!=-1 && (fullPath.length()==(locationOfFirstDot+(pathPresentInEclipse.length())))){
			workspacePath=fullPath;
			int lastLocationOfBaclslash=fullPath.length()-1,i=0;
			while(i<=6){
				workspacePath=workspacePath.substring(0,lastLocationOfBaclslash);
				lastLocationOfBaclslash=workspacePath.lastIndexOf("\\");
				i++;
			}		
		}else{
			fullPath=fullPath.substring(0, fullPath.length()-1);
			int	locationOfProjectName=fullPath.lastIndexOf("\\");
			workspacePath=fullPath.substring(0, locationOfProjectName);
		}
		
		return workspacePath;
	}

}
