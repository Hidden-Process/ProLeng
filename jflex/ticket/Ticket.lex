%%

Nombre = \t*\s*([a-zA-Z]+\s?)*
Unidades = [0-9]+uds
Descuento =(0|[1-9]{1,2}(\.[0-9])?|100)\% 
Precio = [0-9]+(\.[0-9]+)?

%xstate UNIDADES

%%

<YYINITIAL>{

\-{Nombre}                      {
                                  Ticket.addItems(1); 
                                  Ticket.addItemsDistintos(1);
                                }   

\-{Nombre}[\t\s]*\/{Unidades}   {  
                                   Ticket.addItemsDistintos(1);
                                   yybegin(UNIDADES);
                                } 

{Precio}$                       { Ticket.addCompra(Float.parseFloat(yytext()));}

E?{Precio}$                     { 
                                   String cadena = yytext();
                                   cadena = cadena.substring(1,cadena.length());
                                   Ticket.addCompra(Float.parseFloat(cadena));
                                }

{Precio}E?$                     {
                                  String cadena = yytext();
                                  cadena = cadena.substring(0,cadena.length()-1);
                                  Ticket.addCompra(Float.parseFloat(cadena));
                                }

[\t]+ { }

[^]   { }

}

<UNIDADES> {

{Unidades}                      {
                                String cadena = yytext();
                                cadena = cadena.substring(0,cadena.length()-3);
                                Ticket.addItems(Integer.parseInt(cadena));
                                yybegin(YYINITIAL);
                                }

}

