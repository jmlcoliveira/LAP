(*O objetivo da informática e estudar a computacao e formas 
uteis de tirar partido dela para resolver problemas importantes.*)

(*Paradigmas da programacao
    Cada paradigma de programaaco determina uma forma particular 
    de abordar os problemas e de formular as respetivas soluções.
*)

(*Aplicacao parcial*)

let cAdd x y = x+y ;;
let succ = cAdd 1 ;;

succ 5

let f x y = x + y ;;	             (* formato externo preferido *)
let f x = (fun y -> x+y) ;;	     (* formato externo *)
let f = (fun x y -> x+y) ;;	     (* formato externo *)
let f = (fun x -> (fun y -> x+y)) ;; (* formato interno *)

let compose f g x = f (g x) ;;
