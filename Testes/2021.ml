type aTree = ANil | ANode of string * aTree * aTree;;

let at = ANode("a", ANode("b", ANil, ANil), ANode("c", ANil, ANil));;
let ex1 = ANil;;
let ex2 = ANode("a", ANode("c", ANil, ANil), ANode("b", ANil, ANil));;
let ex3 = ANode("a", ANode("b", ANil, ANil), ANode("d", ANil, ANil));;

let rec compatible t1 t2 = 
  match t1, t2 with
   | ANil, ANil -> true
   | ANil, ANode(_, _, _) | ANode(_, _, _), ANil -> true
   | ANode(a, l1, r1), ANode(b, l2, r2) -> a=b && (compatible l1 l2 || compatible l1 r2) && (compatible r1 r2 || compatible r1 l2);;


compatible at at

type repository = (string * string list) list

let rep = [("a", ["b";"c"]); ("b", []); ("c", []); ("d", ["b"])]

let rec childrensOfPerson rep p = 
  match rep with
   | [] -> []
   | (v, elems)::xs -> if v = p then elems else childrensOfPerson xs p

let rec children rep l = 
  match l with
    | [] -> []
    | x::xs -> childrensOfPerson rep x @ children rep xs

let rec anscestor rep c = 
  match rep with
   | [] -> []
   | (a, childs)::xs -> if List.mem c childs then a::anscestor xs c else anscestor xs c

let rec consortsAux rep c = 
  match c with
   | [] -> []
   | x::xs -> anscestor rep x @ consortsAux rep xs

let rec clean v l = 
  match l with
   | [] -> []
   | x::xs -> if x=v then clean v xs else x::clean v xs

let consorts rep p = 
  let c = children rep [p] in
      clean p (consortsAux rep c) ;;


consorts rep "b"
