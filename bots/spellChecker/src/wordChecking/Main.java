package wordChecking;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import editEntry.Organiser;

public class Main {
	public static void main(String[] args) throws IOException{
		if (args.length != 1)
			return;

		Dictionary dic = new Dictionary();
		dic.addDictionary("english.dict");
		SpellChecker checker = new SpellChecker(dic);
		
		Organiser org = new Organiser(checker);
		BufferedReader in = new BufferedReader(new FileReader(args[0]));
		
		int i = 1;
		for(String line = in.readLine() ; line!=null; line = in.readLine()){
			org.checkLine(line, i);
			i++;
		}
		
		org.printErrors();
		
	}
}
