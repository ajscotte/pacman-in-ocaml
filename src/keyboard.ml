open Sdlevent
open Sdlkey

let up event =
  match event with
  | KEYDOWN { keysym = KEY_w; keymod = kmod_none } -> true
  | _ -> false

let left event =
  match event with
  | KEYDOWN { keysym = KEY_a; keymod = kmod_none } -> true
  | _ -> false

let down event =
  match event with
  | KEYDOWN { keysym = KEY_s; keymod = kmod_none } -> true
  | _ -> false

let right event =
  match event with
  | KEYDOWN { keysym = KEY_d; keymod = kmod_none } -> true
  | _ -> false

let ghosts_move event =
  match event with
  | KEYDOWN { keysym = KEY_SPACE; keymod = kmod_none } -> true
  | _ -> false

let start event =
  match event with
  | KEYDOWN { keysym = KEY_RETURN; keymod = kmod_none } -> true
  | _ -> false

let end_game event =
  match event with
  | KEYDOWN { keysym = KEY_ESCAPE } -> true
  | _ -> false
