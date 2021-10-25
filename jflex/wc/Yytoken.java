public class Yytoken {
    public final static int WORD = 127;
    public final static int WS_TAB = 128;
    public final static int EOLN = 10;

    private int token;
    private String valor;

    public Yytoken(int token, String valor) {
         this.token = token;
         this.valor = valor;
    }

    public int getToken()  {
         return token;
    }

    public String getValor() {
         return valor;
    }

    public String toString() {
         return "<"+token+","+valor+">";
    }
}
