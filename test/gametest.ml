open OUnit2
open Game
open Keyboard
open Graph
open Graph2
open Grid
open Pacmanctrl

let graph_empty = create

let graph_two_node = (create_grid [ [ PowerPellet ]; [ Pellet ] ] : G.t)

let graph_complex =
  create_grid
    [
      [ Wall; PowerPellet; Pellet; Wall ];
      [ PowerPellet; Pellet; Wall; Wall ];
      [ Pellet; Wall; Wall; PowerPellet ];
    ]

let vertex_a = (PowerPellet, 0, 0)

let vertex_b = (Pellet, 0, 1)

let vertex00 = (Wall, 0, 0)

let vertex10 = (PowerPellet, 1, 0)

let vertex01 = (PowerPellet, 0, 1)

let vertex11 = (Pellet, 1, 1)

let vertex21 = (Wall, 2, 1)

let vertex12 = (Wall, 1, 2)

let vertex22 = (Wall, 2, 2)

let vertex02 = (Pellet, 0, 2)

let init_simple = initialize_pacman 0 0 graph_two_node

let init_simple2 = initialize_pacman 0 0 graph_two_node

let init_compl = initialize_pacman 2 2 graph_complex

let cmp_set_like_lists lst1 lst2 =
  let uniq1 = List.sort_uniq compare lst1 in
  let uniq2 = List.sort_uniq compare lst2 in
  List.length lst1 = List.length uniq1
  && List.length lst2 = List.length uniq2
  && uniq1 = uniq2

let edge_test name g vrt vrt_lst =
  name >:: fun _ -> assert (cmp_set_like_lists (G.succ g vrt) vrt_lst)

let graph_test =
  [
    (*Empty graph tests*)
    ("empty graph" >:: fun _ -> assert_equal Graph2.create graph_empty);
    (*finding vertex at specific index tests*)
    ( "vertex idx two verteces" >:: fun _ ->
      assert_equal (vertex_at_idx 0 0 graph_two_node) vertex_a );
    ( "vertex idx two verteces" >:: fun _ ->
      assert_equal (vertex_at_idx 0 1 graph_two_node) vertex_b );
    ( "vertex idx\n\n  complex verteces middle" >:: fun _ ->
      assert_equal (vertex_at_idx 2 1 graph_complex) (Wall, 2, 1) );
    ( "vertex idx complex verteces edge" >:: fun _ ->
      assert_equal (vertex_at_idx 3 2 graph_complex) (PowerPellet, 3, 2) );
    (*finding item and a specific idex tests*)
    ( "node_one indexing" >:: fun _ ->
      assert_equal (item_at_idx 0 0 graph_two_node) PowerPellet );
    ( "node_two\n\n  idexing" >:: fun _ ->
      assert_equal (item_at_idx 0 1 graph_two_node) Pellet );
    ( "complex graph idexing middle" >:: fun _ ->
      assert_equal (item_at_idx 1 1 graph_complex) Pellet );
    ( "complex graph idexing edge" >:: fun _ ->
      assert_equal (item_at_idx 3 2 graph_complex) PowerPellet );
    (* edge connection tests*)
    ( "All edges two vertex graph" >:: fun _ ->
      assert_equal (G.succ graph_two_node vertex_a) [ vertex_b ] );
    edge_test "center edges complex\n\n  graph" graph_complex vertex11
      [ vertex01; vertex21; vertex10; vertex12 ];
    edge_test "top corner edges complex graph" graph_complex vertex00
      [ vertex01; vertex10 ];
    edge_test "side center edges complex graph " graph_complex vertex01
      [ vertex00; vertex11; vertex02 ];
    edge_test "bottom center edges complex graph" graph_complex vertex12
      [ vertex11; vertex02; vertex22 ];
    (*replace tests*)
    ( "simple replace item" >:: fun _ ->
      let new_graph = replace 0 0 Empty graph_two_node in
      assert_equal (vertex_at_idx 0 0 new_graph) (Empty, 0, 0) );
    ( "complex replace item" >:: fun _ ->
      let new_graph = replace 2 2 Empty graph_complex in
      assert_equal (vertex_at_idx 2 2 new_graph) (Empty, 2, 2) );
  ]

let pacman_tests =
  [
    (*Initialize tests*)
    ( "00 test init_sim" >:: fun _ ->
      assert_equal (get_position init_simple) (0, 0) );
    ( "22 test init_compl" >:: fun _ ->
      assert_equal (get_position init_compl) (2, 2) );
    (*movement tests*)
    (let movment_simple = move_pacman init_simple2 graph_two_node Up in
     "00 test init_sim" >:: fun _ ->
     assert_equal
       ( vertex_at_idx 0 1 movment_simple,
         get_position init_simple2,
         get_score init_simple2 )
       ((Empty, 0, 1), (0, 1), 10));
  ]

let ghost_tests = []

let tests =
  "Test suite for Pacman" >::: List.flatten [ graph_test; pacman_tests ]

let _ = run_test_tt_main tests
