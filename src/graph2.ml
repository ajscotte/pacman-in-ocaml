(*the graph module*)
(*ref to ocamlgraph Persistant->Bidirectional
  graphs->ConcreteBidirectionalLabled*)
open Graph

exception NoIdx

type graph_item =
  | Pellet
  | PowerPellet
  | Empty
  | Wall

module Vertex = struct
  type t = graph_item * int * int

  let compare = Stdlib.compare

  let hash = Hashtbl.hash

  let equal = ( = )
end

(*creates a bidirectional graph module to build graphs*)
module G = Graph.Persistent.Graph.Concrete (Vertex)
open G

(*Creates a traversal module to go through each element of the graph*)
module Trav = Traverse.Bfs (G)

module W = struct
  type edge = G.edge

  type t = int

  let weight (e1, (g, x, y)) =
    match g with
    | Wall -> 1
    | Pellet
    | Empty
    | PowerPellet ->
        1

  let compare = Stdlib.compare

  let add = ( + )

  let zero = 0
end

(*Creates module for fastest path algoritm*)
module Dijkstra = Path.Dijkstra (G) (W)

(*Makes a graph without any vertices or edges*)
let create = G.empty
