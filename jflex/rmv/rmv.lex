%%

%int

%{

String var = new String();
String val = new String();

%}

Variable = [_a-zA-Z][_a-zA-Z0-9]*

%xstate VALOR,COMILLAS

%%

<YYINITIAL>{

{Variable}/=              {
                             var = yytext();
                             val="";
                             yybegin(VALOR);
                          }
              
{Variable}/=\"            {
                             var = yytext();
                             val="";
                             yybegin(COMILLAS);
                          }
              
\${Variable}              {
                             System.out.print(TablaSimbolos.get(yytext()));
                          }
              
[^]                       {
                             System.out.print(yytext());
                          }

}

<VALOR>{

\=                        { }

[^\n\t;|]                 {
                             val+=yytext();
                          }

[\n\r\t;|]                {
                             TablaSimbolos.put(var,val);
                             yybegin(YYINITIAL);
                          }

}

<COMILLAS>{

\=                        { }

\"                        { }

\"\${Variable}            {
                             String test = yytext();
                             test = test.substring(1,test.length());
                             val=TablaSimbolos.get(test);
                          }

[^\n\t|]                 {
                             val+=yytext();
                          }    
            
[\n\r\t;|]                {
                             TablaSimbolos.put(var,val);
                             yybegin(YYINITIAL);
                          } 
}


