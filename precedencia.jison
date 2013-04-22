%token NUMBER
%left '@'
%right '&'  dummy
%%
list
    :
    | list '\n'
    | list e
    ;

e : NUMBER
  | e '&' e
  | e '@' e %prec dummy
  ;

%%
