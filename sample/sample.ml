open Sdlevent
open Sdlkey
open Game
open Keyboard
open Grid

let rec wait_for_event () =
  let ev = wait_event () in
  if up ev then begin
    print_endline "Up";
    wait_for_event ()
  end
  else if left ev then begin
    print_endline "Left";
    wait_for_event ()
  end
  else if down ev then begin
    print_endline "Down";
    wait_for_event ()
  end
  else if right ev then begin
    print_endline "Right";
    wait_for_event ()
  end
  else if end_game ev then
    print_endline "You pressed escape! The fun is over now."
  else wait_for_event ()

let main () =
  Sdl.init [ `VIDEO ];
  at_exit Sdl.quit;
  ignore (Sdlvideo.set_video_mode ~w:300 ~h:300 []);
  Sdlkey.enable_key_repeat ();
  wait_for_event ()

let _ = main ()
