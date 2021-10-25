import java.io.FileReader;
import java.io.IOException;

public class wc {
    
    private static int character = 0;
    private static int word = 0;
    private static int line = 0;
    
    
    public static void addChar(Yytoken token) {
    	character += token.getValor().length();
    	word++;
    }
    
    public static void addWord() {
    	character++;
    }
    
    public static void addLine(){
        line++;
        character++;
    }
    
    public static int getWords(){
        return word;
    }
    
    public static int getCharacters(){
        return character;
    }
    
    public static int getLines(){
        return line;
    }
    
    
    public static void main(String arg[]) {
    
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
                Yytoken yytoken = null;
		while ((yytoken = lex.yylex()) != null  ) {
                    if (yytoken.getToken() == Yytoken.WORD)  {
                       addChar(yytoken);
                    } else if (yytoken.getToken() == Yytoken.WS_TAB) {
                        addWord();
                    } else if (yytoken.getToken() == Yytoken.EOLN) {
                        addLine();
                    } 
                }
                
               System.out.println(" " + getLines() + "  " + getWords() + " " + getCharacters() + " " + arg[0].toString());
	    } catch (IOException e) {
	    e.printStackTrace();
	    }
        }
    }

}
