public class Yytoken {
    public final static int A = 1;
    public final static int B = 2;
    public final static int C = 3;
    public final static int D = 4;

    private int token;
    private int valor;

    public Yytoken(int token, int valor) {
         this.token = token;
         this.valor = valor;
    }
    
    public Yytoken(int token, String lexema) {
         this(token, Integer.parseInt(lexema));
    }

    public int getToken()  {
         return token;
    }

    public int getValor() {
         return valor;
    }

    public String toString() {
         return "<"+token+","+valor+">";
    }
}
