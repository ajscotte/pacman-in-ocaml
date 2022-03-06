open Graph2
open Keyboard
open Sdlevent
open Grid

exception NoVertex

type pac = {
  mutable position : int * int;
  mutable score : int;
  mutable powerpellet : bool;
}

type direction =
  | Up
  | Down
  | Right
  | Left

let initialize_pacman x y g =
  let vertex = Grid.vertex_at_idx x y g in
  match
    try vertex with
    | NoIdx -> failwith "invalid intial position"
  with
  | _, x', y' -> { position = (x', y'); score = 0; powerpellet = false }

let get_position p = p.position

let get_x p =
  match p with
  | { position = x, y; _ } -> x

let get_y p =
  match p with
  | { position = x, y; _ } -> y

let get_score p = p.score

let movenum = ref 0

let keepincr = ref false

let move_pacman_h p x y g =
  if is_powerpellet x y g then begin
    movenum := 0;
    keepincr := true;
    p.powerpellet <- true
  end
  else if !movenum >= Const.powerpellet_buff then begin
    keepincr := false;
    p.powerpellet <- false
  end
  else if !keepincr && not (is_powerpellet x y g) then movenum := !movenum + 1;

  if is_wall x y g then g
  else (
    p.position <- (x, y);
    p.score <- Const.score (Grid.item_at_idx x y g) + p.score;
    (* p.powerpellet <- is_powerpellet x y g; *)
    Grid.replace x y Empty g)

let move_pacman p g dir =
  let x, y = p.position in
  match dir with
  | Right -> move_pacman_h p (x + 1) y g
  | Left -> move_pacman_h p (x - 1) y g
  | Up -> move_pacman_h p x (y - 1) g
  | Down -> move_pacman_h p x (y + 1) g
