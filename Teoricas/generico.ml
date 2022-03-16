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

(*Padrão          Conjunto de valores representados
~~~~~~          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[]              lista vazia
[x]             listas com um elemento
[x;y]           listas com dois elementos
x::xs           listas não vazias
x::y::xs        listas com pelo menos dois elementos
5::xs           listas cujo primeiro elemento é 5
x               todos os valores (padrão universal)
_               padrão universal anónimo
(x,y)           todos os pares ordenados
(0,y)           todos os pares ordenados cuja 1ª componente é 0
8               inteiro 8
(x,y)::xs       lista não vazia de pares ordenados
'a'..'z'        letras de 'a' a 'z'
*)

(*As avaliações no match são feitas de forma sequencial*)

