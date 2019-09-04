# Precedencia y Asociatividad

Si al construir la tabla LALR, alguna de las entradas de la tabla
resulta multievaluada, decimos que existe un conflicto. Si una de
las acciones es de *reducción* y la otra es de *desplazamiento*,
se dice que hay un *conflicto shift-reduce* o *conflicto de
desplazamiento-reducción*. 

Si las dos reglas indican una acción de
reducción, decimos que tenemos un *conflicto reduce-reduce* o de
*reducción-reducción*. 

En caso de que no existan indicaciones específicas
jison resuelve los conflictos que aparecen en la construcción de
la tabla utilizando las siguientes reglas:

* Un conflicto reduce-reduce se resuelve eligiendo la producción que se listó primero en la especificación de la gramática.
* Un conflicto shift-reduce se resuelve siempre en favor del shift
* Las declaraciones de precedencia y asociatividad mediante las
palabras reservadas `%left` , `%right` , `%nonassoc` se utilizan para
modificar estos criterios por defecto. 
* La declaración de tokens mediante la palabra reservada `%token` no modifica la precedencia.
* Si que lo hacen las declaraciones realizadas usando las palabras left, right y nonassoc.

* Los tokens declarados en la misma línea tienen igual precedencia e igual asociatividad. 
* La precedencia es mayor cuanto mas abajo su posición en el texto. 
* La precedencia de una regla  *A -> alpha* se define **como la del terminal mas a la derecha** que aparece en *alpha*. En el ejemplo, la producción

                              expr : expr '+' expr

  tiene la precedencia del token `+`.

    - Véase el ejemplo [right.eyp](right.eyp) para mas detalles. En dicho ejemplo, en la regla 

                                e -> e '&' e '%' e 

      la precedencia de la regla es la del token `%` no la del token `&`

* Para decidir en un conflicto shift-reduce se comparan la precedencia de la regla con la del terminal que va a ser desplazado. 

* Si la de la regla es mayor se reduce si la del token es mayor, se desplaza.

* Si en un conflicto shift-reduce ambos la regla y el terminal que va a ser desplazado tiene la misma precedencia jison considera la asociatividad, si es asociativa a izquierdas, reduce y si es asociativa a derechas desplaza. Si no es asociativa, genera un mensaje de error. 

* Obsérvese que, en esta situación, la asociatividad de la regla y la del token han de ser por fuerza, las mismas. Ello es así, porque en jison los tokens con la misma precedencia se declaran en la misma línea y sólo se permite una declaración por línea.

* Por tanto es imposible declarar dos tokens con diferente asociatividad y la misma precedencia.

* Es posible modificar la precedencia *natural* de una regla, calificándola con un token específico. Para ello se escribe a la derecha de la regla `prec token`, donde `token` es un token con la precedencia que deseamos. Vea el uso del token `dummy` en el fichero [Precedencia.eyp](Precedencia.eyp). En la regla:

                               e ->  e '@' e %prec dummy

  la precedencia es la del token `dummy` no la del token `@`
