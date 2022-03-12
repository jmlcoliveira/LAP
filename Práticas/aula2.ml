let rec succAll l = 
	match l with 
	| [] -> []
	| x::xs -> x+1 :: succAll xs

succAll [1; 2; 4; 8; 16; 32; 64; 128; 256; 512; 1024]

let rec belongs v l =
	match l with
	| [] -> false
	| x::xs -> if v=x then true else belongs v xs

belongs 4 [1;2;3;4;5;6]
belongs 7 [1;2;3;4;5;6]

let rec contains v l =
	match l with 
	| [] -> false
	| x::xs -> if v = x then true else contains v xs

let rec union l1 l2 = 
	match l1 with
	| [] -> []
	| x::xs -> x:: union l2 xs

union [7;3;9] [2;1;9]

let rec inter l1 l2 =
	match l1 with
	| [] -> []
	| x::xs -> if contains x l2 then x:: inter xs l2 else inter xs l2

inter [7;3;9; 0] [2;1;9; 0]

let rec diff l1 l2 =
	match l1 with
	| [] -> []
	| x::xs -> if contains x l2 then inter xs l2 else x:: inter xs l2

 diff [7;3;9] [2;1;9]


