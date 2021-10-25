%%

%%

[^a-zA-Z]                                                     { }

[a-zA-Z]*[aeiouAEIOU]{2}([a-zA-Z]*[aeiouAEIOU]+)*             {  // 2 vocales seguidas y acaba en vocal
                                                                return new Yytoken(Yytoken.A, "0");
                                                              }
                                                              
[a-zA-Z]*[aeiouAEIOU]{2}[a-zA-Z]*                             { // 2 vocales seguidas y acaba en consonante
                                                                return new Yytoken(Yytoken.C, "0");
                                                              }

[a-zA-Z]*[aeiouAEIOU]+                                        { // No 2 vocales seguidas y acaba en vocal
                                                                return new Yytoken(Yytoken.B, "0");
                                                              }

[a-zA-Z]*                                                     { // No 2 vocales seguidas y acaba en consonante
                                                                return new Yytoken(Yytoken.D, "0");
                                                              }
                                                              
