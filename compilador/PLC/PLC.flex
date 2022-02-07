import java_cup.runtime.*;

%%
%cup
%%

/* Palabras Reservadas */

"if"                            { return new Symbol(sym.IF);    }
"else"                          { return new Symbol(sym.ELSE);  }
"while"                         { return new Symbol(sym.WHILE); }
"do"                            { return new Symbol(sym.DO);    }
"for"                           { return new Symbol(sym.FOR);   }
"print"                         { return new Symbol(sym.PRINT); }

/* Operadores */

"+"                             { return new Symbol(sym.MAS);   }
"-"                             { return new Symbol(sym.MENOS); }
"*"                             { return new Symbol(sym.MUL);   }
"/"                             { return new Symbol(sym.DIV);   }
"="                             { return new Symbol(sym.ASIG);  }
"<"                             { return new Symbol(sym.LT);    }
"<="                            { return new Symbol(sym.LET);   }
">"                             { return new Symbol(sym.GT);    }
">="                            { return new Symbol(sym.GET);   }
"=="                            { return new Symbol(sym.EQ);    }
"!="                            { return new Symbol(sym.NEQ);   }
"!"                             { return new Symbol(sym.NOT);   }
"&&"                            { return new Symbol(sym.AND);   }
"||"                            { return new Symbol(sym.OR);    }

/* Separadores */

"("                             { return new Symbol(sym.AP);    }
")"                             { return new Symbol(sym.CP);    }
"{"                             { return new Symbol(sym.ALL);   }
"}"                             { return new Symbol(sym.CLL);   }
";"                             { return new Symbol(sym.PYC);   }

/* Numeros y Letras */

[a-zA-Z][a-zA-Z0-9]*		    { return new Symbol(sym.IDENT, yytext());  }
0|[1-9][0-9]*				    { return new Symbol(sym.NUMERO, yytext()); }
[^]                             { }
