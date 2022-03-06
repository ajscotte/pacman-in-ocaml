open Graph2

module type GhostFunctions = sig
  type ghost_dets
  (** Abstract type for a ghost *)

  val scatter : Vertex.t -> G.t -> Vertex.t
  (** Goes to selected corner of the board *)

  val chase : ghost_dets -> Vertex.t -> G.t -> unit
  (** Chase pacman with ghost-specific algorithm *)

  val frightened : Vertex.t -> G.t -> Vertex.t
  (** randomly chooses next position based off current position *)

  val init_pos : int -> int -> ghost_dets
  (** [init_pos x y] initializes a ghost at position (x, y) *)

  val get_position : ghost_dets -> int * int
  (** [get_pos ghost] returns the current (x, y) coordinate of [ghost] *)

  val get_x : ghost_dets -> int
  (** [get_x ghost] returns the x coordinate of [ghost]*)

  val get_y : ghost_dets -> int
  (** [get_y ghost] returns the y coordinate of [ghost]*)
end

module Blinky : GhostFunctions = struct
  type ghost_dets = { mutable position : int * int }

  let scatter i g = failwith "not created yet since base on map design"

  (*p is pacmans current position, i is blinky's position*)
  let chase gh p g =
    let x', y' = gh.position in
    let i = Grid.vertex_at_idx x' y' g in
    let l, _ = Dijkstra.shortest_path g i p in
    match l with
    | [] -> ()
    | (v1, (item, x, y)) :: t -> gh.position <- (x, y)

  let frightened i g = failwith "not created yet since base on map design"

  let init_pos x y = { position = (x, y) }

  let get_position gh = gh.position

  let get_x { position = x, y } = x

  let get_y { position = x, y } = y
end

module Pinky : GhostFunctions = struct
  type ghost_dets = { mutable position : int * int }

  let scatter i g = failwith "not created yet since base on map design"

  (*p is pacmans current position, i is blinky's position*)
  let chase gh p g =
    let x', y' = gh.position in
    let i = Grid.vertex_at_idx x' y' g in
    let l, _ = Dijkstra.shortest_path g i p in
    match l with
    | [] -> ()
    | (v1, (item, x, y)) :: t -> gh.position <- (x, y)

  let frightened i g = failwith "not created yet since base on map design"

  let init_pos x y = { position = (x, y) }

  let get_position gh = gh.position

  let get_x { position = x, y } = x

  let get_y { position = x, y } = y
end

module Inky : GhostFunctions = struct
  type ghost_dets = { mutable position : int * int }

  let scatter i g = failwith "not created yet since base on map design"

  (*p is pacmans current position, i is blinky's position*)
  let chase gh p g =
    let x', y' = gh.position in
    let i = Grid.vertex_at_idx x' y' g in
    let l, _ = Dijkstra.shortest_path g i p in
    match l with
    | [] -> ()
    | (v1, (item, x, y)) :: t -> gh.position <- (x, y)

  let frightened i g = failwith "not created yet since base on map design"

  let init_pos x y = { position = (x, y) }

  let get_position gh = gh.position

  let get_x { position = x, y } = x

  let get_y { position = x, y } = y
end

module Clyde : GhostFunctions = struct
  type ghost_dets = { mutable position : int * int }

  let scatter i g = failwith "not created yet since base on map design"

  (*p is pacmans current position, i is blinky's position*)
  let chase gh p g =
    let x', y' = gh.position in
    let i = Grid.vertex_at_idx x' y' g in
    let l, _ = Dijkstra.shortest_path g i p in
    match l with
    | [] -> ()
    | (v1, (item, x, y)) :: t -> gh.position <- (x, y)

  let frightened i g = failwith "not created yet since base on map design"

  let init_pos x y = { position = (x, y) }

  let get_position gh = gh.position

  let get_x { position = x, y } = x

  let get_y { position = x, y } = y
end