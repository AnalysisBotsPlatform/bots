package editEntry;

import java.util.ArrayList;

import wordChecking.SpellChecker;

public class Organiser {
	boolean commentMode = false;
	SpellChecker spellChecker;
	ArrayList<Error> errorList = new ArrayList<Error>();
	
	public Organiser(SpellChecker spellChecker){
		this.spellChecker = spellChecker;
	}
	
	private void checkComment(String line, int linenumber){
		int signumber = 1;
		String s = line;
		
		if (matches(line, "[*/]")){
			String [] l  = line.split("[*/]");
			this.commentMode = l[l.length-1].matches("/*"); 
			
			//as we are in the comment mode, everything before the first "*/" is in every case a comment and has to  be checked
			check(linenumber,signumber,l[0]);
			signumber = l[0].length();
			
			for (int i = 1; i< l.length ; i++){
				if (l[i].matches("/*")){
					String comment = l[i].split("/*")[1];
					check(linenumber,signumber,comment);
					signumber += l[i].length();
				}
			}
		}	
	}
	
	
	private boolean matches(String string, ArrayList<String> testList){
		for (String test: testList){
			if (string.split(test).length>1)
				return true;
		}
		return false;
	}
	
	private boolean matches(String string, String test){
		String[] split = (string + " ").split(test);
			if (split.length>1)
				return true;
		return false;
	}
	
	
	private void checkCode(String line, int linenumber){
		int signumber = 1;
		String s = line;

		
		//checks whether the line contains a line commentary
		//it it is, is simply calls check on the string after the //
		if (line.matches("(.*)//(.*)")){
			String[] l = line.split("//");
			signumber += l[0].length()+2;
			for (int i = 1; i < l.length ; i++){
				signumber += check(linenumber,signumber,l[i]);
			}
			s = l[0];
		}
		
		//checks, whether in the line a block commentary is statet
		// if it is, it also checks, if there are multiple commentary starting/endings
		//if a block commentary is started, but not endet, it sets the commentMode on true
		
		if (matches(s, "[/*]")){
			String[] l2 = s.split("[/*]");
			signumber = l2[0].length()+2;
			for (int i = 1; i < l2.length ; i++){
				if (l2[i].matches("[*/]"))
					check(linenumber,signumber,l2[i].split("*/")[0]);
				else 
					check (linenumber,signumber,l2[i]);
				signumber += l2[i].length();
			}
		commentMode = !l2[l2.length-1].matches("[*/]");
		}
		
		//as there is not a line, not a block commentary, this method simply doesnt to anything on the code
	}
	
	public void printErrors(){
		for (Error error:errorList){
			System.out.println("Error in line " + error.line + " sign number "+error.sign +" : " + error.word);
		}
	}

	private int check(int linenumber, int signumber, String line) {
		
		String[] words = line.split("[\\s|\\W]");
		
		for (String word:words){
			if (!spellChecker.checkWord(word)){
				Error error = new Error(word,linenumber,signumber);
				errorList.add(error);
			}
			signumber += word.length()+1;
		}
		
		return line.length();
	}

	public void checkLine(String line, int linenumber){
		if (commentMode)
			checkComment(line, linenumber);
		else 
			checkCode(line,linenumber);
	}
}
