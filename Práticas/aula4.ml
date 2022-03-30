let rec countEmptyAux ic = 
  (try
  let line = input_line ic in
    (if line = "" then 1 else 0) + countEmptyAux ic
  with End_of_file -> 0  )

let countEmpty filename =
  let ic = open_in filename in
    let v = countEmptyAux ic in
    close_in ic;
    v;;

countEmpty "./Práticas/in.txt"

let writeString oc line = 
  output_string oc (line ^ "\n");
  0;;

let rec clearAux ic oc =
  (try
  let line = input_line ic in
    (if line = "" then 1 else writeString oc line) + clearAux ic oc
  with End_of_file -> 0 )


let clear fileIn fileOut =
  let ic = open_in fileIn in
    let oc = open_out fileOut in
      let v = clearAux ic oc in
        close_in ic;
        close_out oc;
        v;;


clear "./Práticas/in.txt" "./Práticas/out.txt"