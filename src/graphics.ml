(* open Sdlevent *)

let _init (width : int) (height : int) : unit =
  Sdl.init [ `VIDEO ];
  at_exit Sdl.quit;
  ignore (Sdlvideo.set_video_mode ~w:width ~h:height []);
  Sdlkey.enable_key_repeat ()

let init () = _init Const.width Const.height