(** BO3 / BO5 で１試合の勝率からセットの勝率を算出 *)

(** [main rate bo] computes possibility of winning BO[bo] with
    win rate [rate] for 1 game. *)
let win_rate (rate:float) (bo:int) : float =
  let is_valid_rate = 0. <= rate && rate <= 1. in
  if not is_valid_rate then raise (Invalid_argument "rate should be in range [0.0, 1.0]")
  else
  let is_valid_bo = 0 < bo && bo mod 2 = 1 in
  if not is_valid_bo then raise (Invalid_argument "bo should be positive odd number")
  else

  (* [aux games wins] returns win rate (: float) *)
  let rec aux games wins : float =
    if bo / 2 < wins then 1. else
    if bo / 2 < games - wins then 0. else
    let case_win = aux (games + 1) (wins + 1) in
    let case_lose = aux (games + 1) wins in
    rate *. case_win +. (1. -. rate) *. case_lose in
  aux 0 0

let () =
  let usage = "Usage: " ^ Sys.argv.(0) ^ " rate bo" in
  if Array.length Sys.argv <> 3 then print_endline usage
  else

  match Float.of_string_opt Sys.argv.(1) with
  | None -> print_endline usage
  | Some rate ->

  match int_of_string_opt Sys.argv.(2) with
  | None -> print_endline usage
  | Some bo ->

  win_rate rate bo
  |> Printf.printf "%f\n"

