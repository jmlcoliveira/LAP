type tree = Nil | Node of int * tree * tree

let rec make l =
  match l with
    | [] -> Nil
    | x::xs -> Node(x, Nil, make xs)

let rec max t =
  match t with
   | Nil -> failwith "max : tree is empty"
   | Node(x, Nil, Nil) -> x
   | Node(x, Nil, t) | Node(x, t, Nil) -> Stdlib.max x (max t)
   | Node(x, l, r) -> Stdlib.max x (Stdlib.max (max l) (max r))

let empty t = t = Nil

let rec load_aux ic = 
  let x = input_line ic in
    if x = "-" then Nil
    else 
      let l = load_aux ic in
      let r = load_aux ic in
        Node(int_of_string x, l, r)

let load filename = 
  let ic = open_in filename; in
    let t = load_aux ic in
      close_in ic; 
      t


let rec store_aux oc t = 
  match t with
   | Nil -> output_string oc "-"; output_string oc "\n";
   | Node(x, l, r) -> output_string oc (string_of_int x); 
                      output_string oc "\n";
                      store_aux oc l; 
                      store_aux oc r

let store filename t =
  let oc = open_out filename in
    store_aux oc t;
    close_out oc;;


let rec show t =
  match t with
   | Nil -> print_string "-"; print_newline ()
   | Node(x, Nil, t) | Node(x, t, Nil) -> print_int x; print_newline (); show t
   | Node(x, l, r) -> print_int x; print_newline (); show l; show r