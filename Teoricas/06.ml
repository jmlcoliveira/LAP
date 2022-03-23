(*Efeitos laterais

e qualquer atividade que uma função desenvolva para alem de calcular um resultado a partir dos argumentos.

O "unit" equivale a uma funcao que nao devolva nada em Java ou C (void)*)

let print () = print_string "..."; print_string "ddfad"

let list = [1; 2; 3; 4]


let rec printList l =
  match l with
     [] -> ()
   | x::xs -> print_int x ; print_newline () ; printList xs
;;


(*Canais

 Os canais sao valores dos tipos predefinidos in_channel e out_channel.
 
 - stdin : in_channel
 - stdout : out_channel
 - stderr : out_channel
 *)

 output_string stdout "teste"

 (* copyChannel: copia o canal de input ci para o canal de output co *)

let rec copyChannel ci co =
  try
      let s = input_line ci in
          output_string co s ;
          output_string co "\n" ;
          copyChannel ci co
  with End_of_file -> ()
;;

(* copyFile: abre os ficheiros ni e no e depois usa a função copyChannel *)

let copyFile ni no =
  let ci = open_in ni in
      let co = open_out no in
          copyChannel ci co ;
          close_in ci ;
          close_out co
;;

copyFile "./Teoricas/fileIn.txt" "./Teoricas/fileOut.txt";;


(*Modulos OCaml

  - Agrupar definições relacionadas
  - Organizar os nomes das entidades por forma a evitar conflitos de nomes.
  - Ocultar a representação interna dos dados e ocultar as operações auxiliares.
  - Concecao modular de software.

*)

List.length