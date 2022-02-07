public class Generador{

    public static final int LT  = 1;
    public static final int LET = 2;
    public static final int GT  = 3;
    public static final int GET = 4;
    public static final int EQ  = 5;
    public static final int NEQ = 6;
    public static final int AND = 7;
    public static final int OR  = 8;
    public static final int NOT = 9;

    public static int numTempVars = -1;
    public static int numLabels   = -1;

    public static String newTempVar(){
        numTempVars++;
        return "t" + numTempVars;
    }

    public static String newLabel(){
        numLabels++;
        return "L" + numLabels;
    }

    public static void label(String label){
        System.out.println(label + ":");
    }

    public static void gotoLabel(String label){
        System.out.println("\tgoto " + label + ";");
    }

    public static String print(String content){
        System.out.println("\tprint " + content + ";");
        return content;
    }

    public static void halt(){
        System.out.println("\thalt;");
    }

    public static String operacion(String exp){
        String var = newTempVar();
        System.out.println("\t" + var + " = " + exp + ";");
        return var;
    }

    public static String asignacion(String ident, String value){
        System.out.println("\t" + ident + " = " + value + ";");
        return ident;
    }

    public static Tag condicion(int cond, String exp1, String exp2){
        Tag t = new Tag(newLabel(), newLabel());
        switch (cond) {
            case LT: System.out.println("\tif (" + exp1 + " < " + exp2 + ") goto " + t.getV() + ";");
                     System.out.println("\tgoto " + t.getF() + ";");
                break;
            case LET: System.out.println("\tif (" + exp2 + " < " + exp1 + ") goto " + t.getF() + ";");
                      System.out.println("\tgoto " + t.getV() + ";");
                break;
            case GT: System.out.println("\tif (" + exp2 + " < " + exp1 + ") goto " + t.getV() + ";");
                     System.out.println("\tgoto " + t.getF() + ";");
                 break;
            case GET: System.out.println("\tif (" + exp1 + " < " + exp2 + ") goto " + t.getF() + ";");
                      System.out.println("\tgoto " + t.getV() + ";");
                break;
            case EQ:  System.out.println("\tif (" + exp1 + " == " + exp2 + ") goto " + t.getV() + ";");
                      System.out.println("\tgoto " + t.getF() + ";");
                 break;
            case NEQ: System.out.println("\tif (" + exp1 + " == " + exp2 + ") goto " + t.getF() + ";");
                      System.out.println("\tgoto " + t.getV() + ";");
                break;
            default: System.out.println("ERROR: Metodo Condicion;");
                break;
        }

        return t;
    }

    public static Tag operador(int op, Tag exp1, Tag exp2){
        Tag t = exp2;
        switch (op) {
            case NOT: t = new Tag(exp1.getF(), exp1.getV());
                break;
            case AND: label(exp1.getF());
                      gotoLabel(exp2.getV());
                break;
            case OR: label(exp1.getV());
                     gotoLabel(exp2.getF());
                break;
            default: System.out.println("ERROR: Metodo Operador");
                break;
        }
        return t;
    }
}