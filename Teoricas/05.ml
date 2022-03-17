(*Tipos produto (tuplos e registos)*)
(* "Equivalanente" a classes em Java ou struct em C*)
(* Há dois tipos de produtos*)
(* 	-Tipos produto não etiquetados (tuplos)*)
(* 		utilização de produtos cartesiano*)

("João ", 1970, "Lisboa")

let moveTo (x,y,_) city = (x, y, city) ;;

let getName p =
    match p with
      (x, _, _) -> x
;;

(* 	-Tipos produto etiquetados (registos)*)
(* 		Estes requerem uma definicao explicita*)

type pessoa = { nome:string ; anoNasc:int ; morada:string } ;;
{ nome = "João" ; anoNasc = 1970 ; morada = "Lisboa" }

let p = { nome = "João" ; anoNasc = 1970 ; morada = "Lisboa" }

p.nome

(*---------------------------------------*)
(*Tratamento de excecoes*)

let f x:float = 
	try
		1 /. x
	with _ -> x

let rec f x =
	try 
		(f x) + 1
	with Stack_overflow -> 2
			| _ -> 3
			| Divide_by_zero -> -1

f 88

(*-------------------------------------------*)

(*Funções parciais*)
(* São funcoes que nao estao definidas e todo o dominio*)

let rec fact n = (* pre: n >= 0 *)
      if n = 0 then 1
      else if n > 0 then n * fact (n-1)
			else failwith "fact: negative argument"
;;


let rec maxList l =  (* pre: l <> [] *)
    match l with
         [] -> failwith "maxList: empty list"
        | [x] -> x
        | x::xs -> max x (maxList xs)
;;




			
