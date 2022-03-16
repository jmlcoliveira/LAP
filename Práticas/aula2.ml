let rec succAll l = 
	match l with 
	| [] -> []
	| x::xs -> x+1 :: succAll xs
;;

succAll [1; 2; 4; 8; 16; 32; 64; 128; 256; 512; 1024]

let rec belongs v l =
	match l with
	| [] -> false
	| x::xs -> if v=x then true else belongs v xs
;;

belongs 4 [1;2;3;4;5;6]
belongs 7 [1;2;3;4;5;6]

let rec union l1 l2 = 
	match l1 with
	| [] -> l2
	| x::xs -> if belongs x l2 then union xs l2 else x:: union xs l2 
;;

union [7;3;9] [2;1;9];;

let rec inter l1 l2 =
	match l1 with
	| [] -> []
	| x::xs -> if belongs x l2 then x :: inter xs l2 else inter xs l2
;;

inter [7;3;9; 0] [2;1;9; 0]

	let rec diff l1 l2 =
		match l1 with
		| [] -> []
		| x::xs -> if belongs x l2 then diff xs l2 else x:: diff xs l2
	;;

 diff [7;3;9] [2;1;9]

let rec add x l =
	match l with
		| [] -> []
		| s::l -> (x::s)::add x l
;;

let rec power l1 =
	match l1 with
		| [] -> [[]]
		| x::xs -> add x (power xs) @ power xs
;;

let rec nat x =
	if x = 0 then []
	else x-1 :: nat (x-1)
;;

let in v l =
	match l with
	 | [] -> [(v, 1)]
	 |(x, n)::xs -> if x = v then (x, n+1)::xs else (x, 1)::(x, n)::
;;

let rec pack l =
	match l with
	 | [] -> []
	 | x::xs -> add x (pack xs)
;;