(*Escopo Estatico
Nome da regra de resolução de nomes usada na maioria 
das linguagem modernas, incluindo o OCaml, C, C++ e Java.

Regra: Um uso dum nome refere-se sempre a ligacao sintaticamente envolvente, mais proxima.

No exemplo abaixo vemos a aplicacao dessa regra em Ocaml*)
let z = 5 in
    let f x = x + z in
        let z = 6 in
            f 0 (*o "z" a ser usado e o da linha 1, pq o uso do nome z 
                  refere-se a declaracao de z exterior (ou seja, envolvente).*)

let a = 5;;
let f x = x + a;;
let a = 10000;;
f 0

(*Escopo Dinamico
Nome da regra de resolução de nomes atualmente em desuso
Por ser mais confuso para o programador, enntrou em desuso

Regra: Um uso dum nome refere-se sempre a ligacao mais recentemente estabelecida
 para esse nome, temporalmente, durante a execucao do programa.
 
 No caso da funcao da linha 8, o resultado seria 6, pois era usado o valor mais
 recente de z (6)*)