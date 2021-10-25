import java.io.FileReader;
import java.io.IOException;

public class JCom {
    
	public static int normal = 0;
	public static int simple = 0;
	public static int doble = 0;

    public static void main(String arg[]) {
        if (arg.length>0) {
            Yylex lex = null;
            try {
                lex = new Yylex(new FileReader(arg[0]));
                lex.yylex() ;
		    } catch (IOException e) {
		 }
		 
		 System.out.println("// "  +  normal);
		 System.out.println("/* "  +  simple);
		 System.out.println("/** " +  doble);
       }
    } 	
}
