(* Uses encapulation to hide graph datastructure from client *)

open Graph2

val vertex_lst : G.t -> Vertex.t list
(** [vertex_lst g] finds all vertices in [g] *)

val vertex_at_idx : int -> int -> G.t -> Vertex.t
(** [vertex_at_idx x y g] is the vertex at index ([x], [y]) in [g] *)

val item_at_idx : int -> int -> G.t -> graph_item
(** [item_at_idx x y g] is the item at index ([x], [y]) in [g] *)

val create_grid : graph_item list list -> G.t
(** [create_grid itm_lst] makes a grid(graph) of items where each [itm_lst] is
    two dimensional lst *)

val replace : int -> int -> graph_item -> G.t -> G.t
(**[replace v i g] returns a grid with a new vertex [v] in grid [g] with an
   updated item [i]*)

val is_wall : int -> int -> G.t -> bool
(** [is_wall x y g] displays whether the item is a Wall at coordinate ([x], [y])*)

val is_powerpellet : int -> int -> G.t -> bool
(** [is_powerpellet x y g] displays whether the item is a PowerPellet at
    coordinate ([x], [y])*)
