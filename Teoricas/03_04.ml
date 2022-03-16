(*let-in permite:

Aumentar a legibilidade de certas fun��es;
Aumentar a efici�ncia de certas fun��es;
Definir fun��es mutuamente recursivas.


"and" pode ser usada para definir simultaneamente v�rios nomes no mesmo let-in. 

o "in" � usado para definir variaveis locais
*)

let rec even n = if n = 0 then true else odd (n-1)
    and odd n = if n = 0 then false else even (n-1)
;;

(*Tipos soma (uni�es) "Heran�a"*)
type color = int ;;
type point = float*float ;;

type cshape = 
	| Line of color*point*point
  | Circle of color*point*float
  | Rect of color*point*point ;;

(*Inicializar Literais "objeto"*)
let a = Line (34658, (2.5, 7.8), (-24.005, 1000.0001)) ;;
let b = Circle (11111, (-24.005, 1000.0003), 3.1233333) ;;

(*Aceder aos valores do literal, usando emparelhamento de padroes*)
let area cs =
    match cs with
      | Line   (_, _, _) -> 0.0 (*O _ coloca-se se n�o for preciso usar � direita*)
      | Circle (_, _, r) -> 3.14159 *. r *. r
      | Rect   (_, (tx,ty), (bx,by)) -> abs_float ((bx -. tx) *. (by -. ty))
;;

(*Tamb�m � possivel aceder desta forma apenas a um*)
let radius (Circle (_, _, r)) = r ;;

(*etiquetas dum tipo soma tem tr�s pap�is:
	Na defini��o do tipo, identificam os v�rios ramos.
	Denotam os construtores que o sistema cria automaticamente para o tipo em causa. 
		Um construtor � uma fun��o especial que gera valores dum tipo soma. 
		Quando escrevemos Circle(111, (0.0, 0.0), 12.4) estamos a chamar um construtor das nossas formas.
	S�o elementos constituintes de novos padr�es que a linguagem passa a reconhecer automaticamente.*)

(*-------------------------------------------*)

(*Cria��o de arvores binarias)*)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree ;;

let t = Node(1, Node(2,Nil,Nil), Node(3,Nil,Nil)) ;;
(*     1    *)
(*   /   \  *)
(*  2     3 *)

let rec size t =
    match t with
        Nil -> 0
      | Node(x,l,r) ->
            1 + size l + size r
;;

let rec height t =
    match t with
       Nil -> 0
     | Node(x,l,r) ->
           1 + max (height l) (height r)
;;

let rec mirror t =
    match t with
      Nil -> Nil
    | Node (x,l,r) ->
           Node (x,mirror r,mirror l) (* o r e l trocam de posi��o *)
;;
(*-------------------------------------------*)


(*Arvores N-arias*)
type 'a ntree = NNil | NNode of 'a * 'a ntree list ;;

let nt = NNode(1, [NNode(2,[]); NNode(3,[]); NNode(4,[])]) ;;

let makeLeaf v = NNode(v, []) ;;

let rec size t =
    match t with
        NNil -> 0
      | NNode(x,cs) -> 1 + lsize cs
and lsize tl =
    match tl with
        [] -> 0
      | t::ts -> size t + lsize ts
;;

let rec mirror t =
    match t with
        NNil -> NNil
      | NNode(x,cs) -> NNode(x,lmirror cs)
and lmirror tl =
    match tl with
        [] -> []
      | t::ts -> lmirror ts @ [mirror t]
;;
(*-------------------------------------------*)


