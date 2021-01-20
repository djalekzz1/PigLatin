public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
  lines = loadStrings("LowellHymn.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
  }
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
   for(int i =0; i<sWord.length();i++){
    if(sWord.substring(i,i+1).toLowerCase().equals("a") || sWord.substring(i,i+1).toLowerCase().equals("e")
     || sWord.substring(i,i+1).toLowerCase().equals("i") || sWord.substring(i,i+1).toLowerCase().equals("o")
      || sWord.substring(i,i+1).toLowerCase().equals("u")
    ){
      return i;
    }
  }
	return -1;
}

public int findFirstPunctuation(String sWord)
{
   for(int i =0; i<sWord.length();i++){
    if(sWord.substring(i,i+1).equals(",") || sWord.substring(i,i+1).equals(".")
    ){
      return i;
    }
  }
  return sWord.length();
}


public String pigLatin(String sWord){
  //return if blank space
  if(sWord.length()==0)
    return sWord;
    
  int firstPunctuation = findFirstPunctuation(sWord);
  String lastCharacter = sWord.substring(firstPunctuation);  //get punctuation character if exists
  
  sWord = sWord.substring(0,firstPunctuation);
  
  String[] words = sWord.split(" ");
  
  StringBuilder sb = new StringBuilder();
  
  for(int i=0; i<words.length; i++){
    sb.append(pigLatinWord(words[i]));
    if(i!=words.length-1)
      sb.append(" ");
  }
  return sb.append(lastCharacter).toString();
}

public String pigLatinWord(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  int firstVowelLocation = findFirstVowel(sWord);
	if(firstVowelLocation == -1)
	{
		return sWord + "ay";
	}
  else if(firstVowelLocation == 0) {
    return sWord + "way";
  }
  else if(firstVowelLocation > 0) {
    if(sWord.substring(0,2).equals("qu")) {
      return sWord.substring(2) + "quay";
    }
    else
      return sWord.substring(firstVowelLocation) +sWord.substring(0,firstVowelLocation)+ "ay";
  }
	{
		return "ERROR!";
	}
}
