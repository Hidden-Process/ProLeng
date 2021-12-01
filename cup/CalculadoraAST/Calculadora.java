import java.io.*;
   
public class Calculadora {
  static public void main(String argv[]) {    
    /* Start the parser */
    try {
      parser p = new parser(new Yylex(new FileReader(argv[0])));
      p.parse();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}


