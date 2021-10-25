%%

%int

%{

String var = new String();
String val = new String();

%}

Variable = [a-zA-Z_][a-zA-Z0-9_]*

%xstate RENOMBRAR,CODIGO,CONCATENAR,ASOCIAR

%%

<YYINITIAL>{

class[^]               {
                           System.out.print(yytext());
                           var="";
                           val="";
                           yybegin(RENOMBRAR);
                       }
                       
\)\s\{                 {
                           System.out.print(yytext());
                           yybegin(CODIGO);
                       }

[^]                    {
                           System.out.print(yytext());
                       }

}

<RENOMBRAR>{

{Variable}             {
                           System.out.print(yytext()+"_rmj");
                           yybegin(YYINITIAL);
                       }


[^]                    {
                           System.out.println(yytext());
                       }

}

<CODIGO>{

"System.out.print(" | "System.out.println("  {
                                                System.out.print(yytext());
                                                System.out.print("\"");
                                                yybegin(CONCATENAR);
                                             }

"String "{Variable}                          {  
                                                var = yytext().substring(7);
                                                yybegin(ASOCIAR);
                                             }

[^]                                          {
                                                System.out.print(yytext());
                                             }
}

<CONCATENAR>{

\"{Variable}\"                               {
                                                String str = yytext().substring(1,yytext().length()-1);
                                                System.out.print(str);
                                             }           

\+                                           {  }

\);                                          {
                                                System.out.print("\"");
                                                System.out.print(yytext());
                                                yybegin(YYINITIAL);
                                             }

}

<ASOCIAR>{

\"({Variable}\s?)+\"                         {
                                                TablaSimbolos.put(var,yytext());               
                                             }

"System.out.print(" | "System.out.println("  {
                                                System.out.print(yytext());
                                                System.out.print(TablaSimbolos.get(var));
                                             }

\);                                          { 
                                                System.out.print(yytext());
                                                yybegin(CODIGO);
                                             }

[^]                                          {  }

}
