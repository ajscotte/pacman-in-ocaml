open Graph2

let vertex_lst g = Trav.fold (fun x y -> x :: y) [] g

let rec return_at_idx_h f x y = function
  | [] -> raise NoIdx
  | (item, x', y') :: t ->
      if x' = x && y' = y then f (item, x', y') else return_at_idx_h f x y t

let vertex_at_idx x y g =
  let lst = vertex_lst g in
  return_at_idx_h (fun v -> v) x y lst

let item_at_idx x y g =
  let lst = vertex_lst g in
  return_at_idx_h (fun (item, x', y') -> item) x y lst

let is_wall x y g =
  let wall = item_at_idx x y g in
  wall = Wall

let is_powerpellet x y g = item_at_idx x y g = PowerPellet

let rec create_grid_h_x x y g itm_lst lst =
  match itm_lst with
  | [] -> create_grid_h 0 (y + 1) g lst
  | h' :: t' ->
      let new_v = (h', x, y) in
      let add_v = G.add_vertex g new_v in
      if y = 0 && x = 0 then create_grid_h_x (x + 1) y add_v t' lst
      else if y = 0 then
        create_grid_h_x (x + 1) y
          (G.add_edge add_v new_v (vertex_at_idx (x - 1) y g))
          t' lst
      else if x = 0 then
        create_grid_h_x (x + 1) y
          (G.add_edge add_v new_v (vertex_at_idx x (y - 1) g))
          t' lst
      else
        create_grid_h_x (x + 1) y
          (G.add_edge
             (G.add_edge add_v new_v (vertex_at_idx x (y - 1) g))
             new_v
             (vertex_at_idx (x - 1) y g))
          t' lst

and create_grid_h x y g = function
  | [] -> g
  | h :: t -> create_grid_h_x x y g h t

let create_grid itm_lst = create_grid_h 0 0 create itm_lst

let rec replace_h v g = function
  | [] -> g
  | h :: t -> replace_h v (G.add_edge g v h) t

let replace x y i g =
  let item = item_at_idx x y g in
  let old_edges = G.pred g (item, x, y) in
  let new_vertex = (i, x, y) in
  let new_graph = G.remove_vertex g (item, x, y) in
  let new_graph2 = G.add_vertex new_graph new_vertex in
  replace_h new_vertex new_graph2 old_edges
