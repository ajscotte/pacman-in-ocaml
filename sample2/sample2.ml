open Sdlevent
open Sdlkey
open Game
open Keyboard
open Grid
open Pacmanctrl
open Ghost

let graph_complex =
  create_grid
    [
      [ Wall; Wall; Wall; Wall; Wall; Wall; Wall ];
      [ Wall; Pellet; Pellet; PowerPellet; Pellet; Empty; Wall ];
      [ Wall; Empty; Pellet; Pellet; Empty; Empty; Wall ];
      [ Wall; Pellet; PowerPellet; Empty; Pellet; Pellet; Wall ];
      [ Wall; Wall; Wall; Wall; Wall; Wall; Wall ];
    ]

let pacman = initialize_pacman 1 1 graph_complex

let blinky = Blinky.init_pos 4 2

let inky = Inky.init_pos 4 1

let pinky = Pinky.init_pos 3 2

let clyde = Clyde.init_pos 5 3

let start_pressed = ref false

let print_details pacman blinky inky pinky clyde =
  print_endline "\nPac-Man\t\tBlinky\t\tPinky\t\tClyde\t\tInky";
  print_endline
    "--------------------------------------------------------------------";

  print_string "(";
  print_int (Pacmanctrl.get_x pacman);
  print_string ", ";
  print_int (Pacmanctrl.get_y pacman);
  print_string ")\t\t";

  print_string "(";
  print_int (Blinky.get_x blinky);
  print_string ", ";
  print_int (Blinky.get_y blinky);
  print_string ")\t\t";

  print_string "(";
  print_int (Inky.get_x inky);
  print_string ", ";
  print_int (Inky.get_y inky);
  print_string ")\t\t";

  print_string "(";
  print_int (Pinky.get_x pinky);
  print_string ", ";
  print_int (Pinky.get_y pinky);
  print_string ")\t\t";

  print_string "(";
  print_int (Clyde.get_x clyde);
  print_string ", ";
  print_int (Clyde.get_y clyde);
  print_string ")\n";

  print_string "Score: ";
  print_int (get_score pacman);
  print_endline ""

(* let print_pacman pacman = print_endline "\nPac-Man:"; print_endline
   "--------"; print_string "Position: ("; print_int (Pacmanctrl.get_x pacman);
   print_string ", "; print_int (Pacmanctrl.get_y pacman); print_string ")\n";
   print_string "Score: "; print_int (get_score pacman); print_endline "" *)

(* let print_ghost_details ghost = print_endline "\nBlinky:"; print_endline
   "-------"; print_string "Position: ("; print_int (Blinky.get_x ghost);
   print_string ", "; print_int (Blinky.get_y ghost); print_string ")\n" *)

let rec movement_test graph =
  let ev = wait_event () in
  (* don't let player move pacman without starting the game first *)
  if !start_pressed then
    if up ev then begin
      print_endline "Up";
      let up_graph = move_pacman pacman graph Up in
      print_details pacman blinky inky pinky clyde;
      movement_test up_graph
    end
    else if left ev then begin
      print_endline "Left";
      let left_graph = move_pacman pacman graph Left in
      print_details pacman blinky inky pinky clyde;
      movement_test left_graph
    end
    else if down ev then begin
      print_endline "Down";
      let down_graph = move_pacman pacman graph Down in
      print_details pacman blinky inky pinky clyde;
      movement_test down_graph
    end
    else if right ev then begin
      print_endline "Right";
      let right_graph = move_pacman pacman graph Right in
      print_details pacman blinky inky pinky clyde;
      movement_test right_graph
    end
    else if ghosts_move ev then begin
      print_endline "Space";
      let pacman_vertex =
        vertex_at_idx (Pacmanctrl.get_x pacman) (Pacmanctrl.get_y pacman) graph
      in
      Blinky.chase blinky pacman_vertex graph;
      Inky.chase inky pacman_vertex graph;
      Pinky.chase pinky pacman_vertex graph;
      Clyde.chase clyde pacman_vertex graph;
      print_details pacman blinky inky pinky clyde;
      movement_test graph
    end;
  if start ev && not !start_pressed then begin
    start_pressed := true;
    print_details pacman blinky inky pinky clyde;
    movement_test graph
  end
  else if end_game ev then begin
    print_endline "Thanks for playing!\n";
    exit 0
  end
  else movement_test graph

let main () =
  Sdl.init [ `VIDEO ];
  at_exit Sdl.quit;
  ignore (Sdlvideo.set_video_mode ~w:300 ~h:300 []);
  Sdlkey.enable_key_repeat ();
  movement_test graph_complex

let _ = main ()
