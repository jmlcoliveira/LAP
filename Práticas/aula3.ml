type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

type 'a ntree = NNil | NNode of 'a * 'a ntree list

let rec howMany v t =
  match t with
    | Nil -> 0
		| Node(x, l, r) -> howMany x l + howMany x r + (if x=v then 1 else 0)
    (*| Node(x, l, r) -> if x=v then 1 + howMany x l + howMany x r else howMany x l + howMany x r*)
		
let rec eqPairs t =
  match t with
    | Nil -> 0
    | Node((a, b), l, r) -> eqPairs l + eqPairs r + (if a=b then 1 else 0)
									
let rec treeToList t =
  match t with
    | Nil -> []
    | Node(x, l, r) -> x::treeToList l @ treeToList r

let rec height t =
  match t with
    | Nil -> 0
    | Node(x,l,r) -> 1 + max (height l) (height r)

let rec balanced t =
  match t with
    | Nil -> true
    | Node(x, l, r) -> if abs(height l - height r) <= 1 then balanced l && balanced r else false

let rec belongs v l =
    match l with
    | [] -> false
    | x::xs -> if v=x then true else belongs v xs
  

let rec union l1 l2 = 
  match l1 with
  | [] -> l2
  | x::xs -> if belongs x l2 then union xs l2 else x:: union xs l2 
    

let rec subtrees t = 
  match t with
    | Nil -> [Nil]
    | Node(x, l, r) -> Node(x, l, r) :: union (subtrees l) (subtrees r)


let rec spring v t =
  match t with
    | Nil -> Node(v, Nil, Nil)
    | Node(x, l, r) -> Node(x, spring v l, spring v r)


let rec fall t =
  match t with
    | Nil -> Nil
		| Node(_, Nil, Nil) -> Nil
    | Node(x, l, r) -> Node(x, fall l, fall r)


let rec nTreeToList t =
  match t with
    | NNil -> []
    | NNode(x, cs) -> x :: tL cs
and tL t = 
  match t with
    | [] -> []
    | t::ts -> nTreeToList t @ tL ts



let rec nFall t =
  match t with
    | NNil -> NNil
    | NNode(x, []) -> NNil
    | NNode(x,cs) -> NNode(x, lnFall cs)
and lnFall tl =
  match tl with
    | [] -> []
    | t::ts ->  nFall t @ lnFall ts
;;