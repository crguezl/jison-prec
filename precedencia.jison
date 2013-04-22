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
                  var s =  eval('$$');
                  //console.log(s);
                  $$ = [];
                }
    | list '\n'
                {
                  var s =  eval('$$');
                  //console.log(s);
                  $$ = $1;
                }
    | list e
                {
                  var s =  eval('$$');
                  //console.log(s);
                  $$ = $1;
                  $$.push($e);
                }
    ;

e : NUMBER
                {
                  var s =  eval('$$');
                  //console.log(s);
                  $$ = "NUMBER ("+yytext+")";
                }
  | e '&' e
                {
                  var s =  eval('$$');
                  //console.log(s);
                  $$ = [ "&", $e1, $e2];
                }
  | e '@' e %prec dummy
                {
                  var s =  eval('$$');
                  //console.log(s);
                  $$ = ["@", $e1, $e2];
                }
  ;

%%
