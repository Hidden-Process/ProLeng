%%

%int

%xstate NORMAL,SIMPLE,DOBLE,LITERAL

%%

<YYINITIAL>{

\/\/               {yybegin(NORMAL);   }

\/\*               {yybegin(SIMPLE);   }

\/\*\*             {yybegin(DOBLE);    }

\"                 {yybegin(LITERAL);  }

[^]                {                   }

}

<NORMAL>{

[^\s\t]            {JCom.normal++;     }

\n                 {yybegin(YYINITIAL);}

[^]                {                   }

}

<SIMPLE>{

[^\s\t\n]          {JCom.simple++;     }

\*\/               {yybegin(YYINITIAL);}

[^]                {                   }

}

<DOBLE>{

[^\s\t\n]          {JCom.doble++;      }

\*\/               {yybegin(YYINITIAL);}

[^]                {                   }

}

<LITERAL>{

\"                 {yybegin(YYINITIAL);}

[^]                {                   }

}
