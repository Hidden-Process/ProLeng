import java.io.FileReader;
import java.io.IOException;

public class cpv { 

    public static int sumaA = 0;
    public static int sumaB = 0;
    public static int sumaC = 0;
    public static int sumaD = 0;

    public static int getA(){ return sumaA; }
    public static int getB(){ return sumaB; }
    public static int getC(){ return sumaC; }
    public static int getD(){ return sumaD ;}
    
    public static void main(String arg[]) {
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
                Yytoken yytoken = null;
		while ((yytoken = lex.yylex()) != null) {
                    if (yytoken.getToken() == Yytoken.A)      {sumaA++; } 
                    else if (yytoken.getToken() == Yytoken.B) {sumaB++; }
                    else if (yytoken.getToken() == Yytoken.C) {sumaC++; }
                    else if (yytoken.getToken() == Yytoken.D) {sumaD++; }
                }
                
                System.out.println("A " + getA());
                System.out.println("B " + getB());
                System.out.println("C " + getC());
                System.out.println("D " + getD());
                
	        } catch (IOException e) {
	      }
       }
   }
}
