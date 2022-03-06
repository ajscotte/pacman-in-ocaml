(** All of the constants used in the game*)

val fps : int
(** Frames per second that the game runs in. In other words, refresh rate of GUI*)

val width : int
(** Width of GUI window*)

val height : int
(** Height of GUI window*)

val score : Graph2.graph_item -> int
(** Base score of each action that can be taken. For example, a pellet is worth
    10, power pellet is 50*)

val powerpellet_buff : int
(** Number of moves Pac-Man does after consuming a powerpellet, after which the
    buff wears off*)
