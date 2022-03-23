(*Lista*)
let rec func l =
	match l with
	| [] -> ...
	| x::xs ... func xs ...
;;

(*Arvore Binaria*)
 let rec func t =
    match t with
         Nil ->  ...
       | Node(x,l,r) ->
             ... func l ... func r ...
;;

(*Arvore n-aria*)
let rec f t =
    match t with
        NNil -> ...
      | NNode(x,cs) -> ... lf cs ...
and lf tl =
    match tl with
        [] -> ...
      | t::ts -> ... f t ... lf ts ... 
;;

(*Tratamento de ficheiros*)

let rec f ci =
  try
      let s = input_line ci in
          ... f ci ...
  with End_of_file -> ...
;;

(*Padr�o          Conjunto de valores representados
~~~~~~          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[]              lista vazia
[x]             listas com um elemento
[x;y]           listas com dois elementos
x::xs           listas n�o vazias
x::y::xs        listas com pelo menos dois elementos
5::xs           listas cujo primeiro elemento � 5
x               todos os valores (padr�o universal)
_               padr�o universal an�nimo
(x,y)           todos os pares ordenados
(0,y)           todos os pares ordenados cuja 1� componente � 0
8               inteiro 8
(x,y)::xs       lista n�o vazia de pares ordenados
'a'..'z'        letras de 'a' a 'z'
*)

(*As avalia��es no match s�o feitas de forma sequencial*)

(*failwith retorna algo do tipo a' *)