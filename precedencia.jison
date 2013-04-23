%token NUMBER
%left '@'
%right '&'  dummy
%%
s 
    : list      { console.log($list); }
    ;

list
    :
                {
                  $$ = [];
                }
    | list '\n'
                {
                  $$ = $1;
                }
    | list e
                {
                  $$ = $1;
                  $$.push($e);
                }
    ;

e : NUMBER
                {
                  $$ = "NUMBER ("+yytext+")";
                }
  | e '&' e
                {
                  $$ = [ "&", $e1, $e2];
                }
  | e '@' e %prec dummy
                {
                  $$ = ["@", $e1, $e2];
                }
  ;

%%
