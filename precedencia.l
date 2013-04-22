%%
\s+                               {}
\d+(\.\d*)?([eE][-+]?\d+)?        return 'NUMBER';
(.|\n)                            return yytext;
