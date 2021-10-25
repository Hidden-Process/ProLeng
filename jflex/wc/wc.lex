%%

%%

[^ \t\f\r\n]+            { 
                              return new Yytoken(Yytoken.WORD, yytext());
                         }
[ \t\f]                  { 
                              return new Yytoken(Yytoken.WS_TAB, "0");
                         }  
\r|\n|\r\n               { 
                              return new Yytoken(Yytoken.EOLN, "0");
                         }
