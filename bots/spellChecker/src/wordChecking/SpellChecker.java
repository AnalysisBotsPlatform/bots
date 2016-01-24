package wordChecking;

public class SpellChecker {
	Dictionary dictionary;
	
	public SpellChecker(Dictionary dictionary){
		this.dictionary = dictionary;
	}
	
	public boolean checkWord(String word){
		return dictionary.contains(word);
	}
}
