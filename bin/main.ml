(* open Game open Graph2 open Keyboard *)
open Sdlevent
open Sdlkey
open Game
open Keyboard

let move dir = print_endline dir

let rec wait_for_event () =
  let ev = wait_event () in
  if up ev then move "Up"
  else if left ev then move "Left"
  else if down ev then move "Down"
  else if right ev then move "Right"
  else if end_game ev then begin
    print_endline "You pressed escape! The fun is over now.";
    exit 0
  end;
  wait_for_event ()

let main () =
  Graphics.init ();
  wait_for_event ()

let _ = main ()
