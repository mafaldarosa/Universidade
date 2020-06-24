type element = Empty| X;;

  let rec length =
    function [] -> 0
    |_::x -> 1 + length x;;

  let rec range linha c0 c1 = c0 >= c1 || linha[c0] == x && range linha (c0 + 1) c1;;

  let sub linha c0 lg = c0 + lg <= length linha && range linha c0 (c0 + lg);;

  let rec fun_linha linha c0 c_linha =
    if c0 >= (length linha) then c_linha == [] 
    else match linha[c0] with
      | Empty -> (fun_linha linha (c0 + 1) c_linha)
      | x -> match c_linha with
        | [] -> false
        | [k::t] -> if (sub linha c0 nX) then let c0 = c0 + k in (c0 >= (length linha) || linha[c0] == Empty) && (fun_linha linha (c0 + 1) t) else false;;
 
  let rec ver_linha tab l0 c_linha = (length tab) || match c_linha with
      | [c_linha::t] -> (ver_linha tab[l0] 0 c_linha) && (ver_linha tab (l0 + 1) t)
      | [] -> assert false;;

  let caracter x = match x with
    | Empty -> '.'
    | X -> 'X';;

  let print_tab tab = let print_linha k = Array.iter (fun a-> print_char (caracter x)) k;
      print_string("\n");
    Array.iter(print_linha tab);;

  let puzzle c_linha c_col=
    let alt = length(c_linha) and lg = length(c_col) in  tab = Array.make_matrix alt lg Empty in
    let rec func col linha c_col = if col >= width then (if (ver_linha tab 0 c_linha) then (print_tbl tab)) else match c_col with
         | [[] :: resto] -> (func col + 1) 0 resto
         | [[k::t]::resto] -> assert (k > 0), if (linha + k <- alt) then 
            for (l in linha to linha + k - 1) 
              tab[l][col]<- x
            done;
            (func col (linha + nX + 1) (t::rest_patt));
            for (l in linha to linha + k - 1) 
              tab[l][col] = Empty
            done;
            (func col (linha + 1) c_col);
        | [] -> assert false
    in (func 0 0 c_col);;