val up : Sdlevent.event -> bool
(** [up event] is [true] on the [event] that 'W' is pressed on the keyboard,
    [false] otherwise *)

val left : Sdlevent.event -> bool
(** [left event] is [true] on the [event] that 'A' is pressed on the keyboard,
    [false] otherwise *)

val down : Sdlevent.event -> bool
(** [down event] is [true] on the [event] that 'S' is pressed on the keyboard,
    [false] otherwise *)

val right : Sdlevent.event -> bool
(** [right event] is [true] on the [event] that 'D' is pressed on the keyboard,
    [false] otherwise *)

val ghosts_move : Sdlevent.event -> bool
(** [ghosts_move event] is [true] on the [event] that 'Space' is pressed on the
    keyboard, [false] otherwise *)

val start : Sdlevent.event -> bool
(** [start event] is [true] on the [event] that 'Enter/Return' is pressed on the
    keyboard, [false] otherwise *)

val end_game : Sdlevent.event -> bool
(** [end_game event] is [true] on the [event] that 'Escape' is pressed on the
    keyboard, [false] otherwise *)
