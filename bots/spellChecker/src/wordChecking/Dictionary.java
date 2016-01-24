package wordChecking;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.TreeSet;

public class Dictionary {
	TreeSet<String> content;
	
	public Dictionary(){
		this.content = new TreeSet<String>();
	}
	
	public void addDictionary(String path) throws IOException{
		 BufferedReader in = new BufferedReader(new FileReader(path));
		 
		 for (String line = in.readLine() ; line != null ; line = in.readLine()){
			 if (line == "") 
				 continue;
			 
			 content.add(line);
		 }
		 
		 in.close();
			 
	}
	
	public boolean contains(String s){
		return content.contains(s);
	}
}
