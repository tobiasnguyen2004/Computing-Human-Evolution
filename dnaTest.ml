;; open Assert
;; open Dna
;; open Helices

(* The assertion library by default will run _all_ of the test cases associated
 * with this program.  However, while debugging you may prefer to have the
 * testing stop on the first failure that is encountered. Comment the line
 * below to turn off first-failure. *)
;; stop_on_failure ()


(******************************************************************************)
(********************** REMEMBER TO WRITE TESTS FIRST! ************************)
(********************* WRITE ALL TESTS BELOW THIS POINT ***********************)
(******************************************************************************)

(* If you'd like to test your helper functions, you should do that in dna.ml.
 * The only way you can test them in this file is by declaring them in
 * dna.mli - however if you do so your code won't compile with the grading
 * server because you don't submit your own dna.mli!
 *
 * If you'd like to write trees to use in your tests, put them in this file.
 * When writing trees of depth greater than 1 for tests, please indent all 
 * children by 4 spaces, separate children by line breaks, and place parentheses
 * similar to the following tree:
 *
 * LNode (
 *     LNode (
 *         LLeaf h1,
 *         h2,
 *         LLeaf h3
 *     ),
 *     h4,
 *     LLeaf h5
 * )
 *
*)

(************************ complementary_helix tests ***************************)

(* Here's an example test case.  Be sure to fill in the incomplete test cases
 * we provided. *)

let test () : bool =
  complementary_helix [T] = [A]
;; run_test "complementary_helix singleton" test

let test () : bool =
  complementary_helix [C; T; T; C] = [G; A; A; G]
;; run_test "complementary_helix multi-element list" test

let test () : bool =
  complementary_helix [C; T; A; A; T; G; T] = [G; A; T; T; A; C; A]
;; run_test "complementary_helix multi-element list with all nucleotides" test



(*************************** hamming_distance tests ***************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem. *)

let test () : bool =
  hamming_distance [G; A] [G; T] = 1
;; run_test "hamming_distance one different nucleotide" test

let test () : bool =
  hamming_distance [G; A] [G; A] = 0
;; run_test "hamming_distance same helices" test

let test () : bool =
  hamming_distance [A; A; C; T; G] [A; A; C; G; T] = 2
;; run_test "hamming_distance two different nucleotide" test

let test () : bool =
  hamming_distance [A; A; C; T; G; T; G] [T; G; A; G; T; A; T] = 7
;; run_test "hamming_distance seven different nucleotide" test



(************************ decreasing_similarity tests *************************)

(* Be sure to add your own test cases -- we will be grading the tests for this 
 * problem. *)

(* Add your test here *)

let test () : bool =
  decreasing_similarity (question_most_like_human ())
;; run_test "question_most_like_human" test

let test () : bool =
  not (decreasing_similarity(
  [gorilla; chimpanzee; pileated_gibbon; white_cheeked_gibbon; lar_gibbon]))
;; run_test "random order" test

let test () : bool =
  decreasing_similarity ([chimpanzee; chimpanzee; chimpanzee])
;; run_test "same helices" test

let test () : bool =
  decreasing_similarity ([lar_gibbon])
;; run_test "single helix" test

let test () : bool =
  decreasing_similarity ([])
;; run_test "empty list" test


(**************************** acids_of_helix tests ****************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem.  Also be sure to fill in the incomplete test case
 * we provided. *)

let test () : bool =
  acids_of_helix [A; G; T; A; C] = [Met]
;; run_test "acids_of_helix single codon" test

let test () : bool =
  acids_of_helix [T; A; C; G; T; C; T; A; C; T; A; C] =
  [Met; Gln; Met; Met]
;; run_test "acids_of_helix with multiple Mets " test

let test () : bool =
  acids_of_helix [T; G; A; A; C; T; A; G; C] = []
;; run_test "acids_of_helix without TAC" test

let test () : bool =
  acids_of_helix [T; A; C; T; G; A; A; T; T] =
  [Met; Thr]
;; run_test "acids_of_helix one met with an end marker" test


(************ Kudos problem: all_acids_of_helix tests *************************)

(* These tests are commented out because they are for the kudos problem.
 * If you attempt this problem, remember to uncomment the tests. And write
 * some of your own! *)

(*
let test () : bool =
  all_acids_of_helix [T; A; C; A; C; T] = [[Met]]
;; run_test "all_acids_of_helix  [T; A; C; A; C; T]" test

let test () : bool =
  all_acids_of_helix [T; A; C; A; C; T; T; A; C; A; C; T] = [[Met]; [Met]]
;; run_test "all_acids_of_helix [T; A; C; A; C; T; T; A; C; A; C; T]" test

let test () : bool =
  all_acids_of_helix [T; A; C; A; C; T; G; A; T; A; C; A; C; T] = [[Met]; [Met]]
;; run_test "all_acids_of_helix [T; A; C; A; C; T; G; A; T; A; C; A; C; T]" test
*)


(***************************** count_leaves tests *****************************)

(* Here are two example tests cases. Both trees should contain exactly four
 * species. Don't forget to add your own test cases! *)

let test () : bool =
  count_leaves (greater_apes ()) = 4
;; run_test "count_leaves greater_apes" test

let test () : bool =
  count_leaves (lesser_apes ()) = 4
;; run_test "count_leaves lesser_apes" test

let test () : bool =
  count_leaves (Leaf gorilla) = 1
;; run_test "count_leaves one leaf" test

let test () : bool =
  count_leaves (
    Node(
      Node(
      Leaf orangutan,
        Node(
        Leaf human,       
        Leaf white_cheeked_gibbon
        )
      ),
      Node(
      Leaf orangutan,
        Node(
        Leaf human,       
        Leaf white_cheeked_gibbon
        )
      )
    )
  ) = 6
;; run_test "count_leaves same leaves" test


(**************************** helix_of_tree tests *****************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem. *)

let test () : bool =
  helix_of_tree (LNode (LLeaf [T], [A], LLeaf [G])) = [A]
;; run_test "helix_of_tree lnode" test

let test () : bool =
  helix_of_tree (LLeaf [T]) = [T]
;; run_test "helix_of_tree leaf" test

let test () : bool =
  helix_of_tree( 
    LNode( 
      LNode( 
      LLeaf [G],
      [G],
      LLeaf [A]
      ), 
      [A], 
      LNode(
        LNode(
        LLeaf [G], 
        [T],
        LLeaf [C]
        ),
        [G],
        LLeaf [T]
        )
      )
    ) = [A]
;; run_test "helix_of_tree multiple element tree" test

(**************************** unlabel_tree tests ******************************)

(* Here's an example test case.  Be sure to add your own--we will be grading the
 * tests for this problem. *)

let test () : bool =
  unlabel_tree (LNode (LLeaf [T], [A], LLeaf [G])) =
  Node (Leaf [T], Leaf [G])
;; run_test "unlabel_tree depth-2 tree" test

let test () : bool =
  unlabel_tree (LLeaf [T]) = Leaf [T]
;; run_test "unlabel_tree single leaf" test

let test () : bool =
  unlabel_tree( 
    LNode( 
      LNode( 
      LLeaf [G],
      [G],
      LLeaf [A]
      ), 
      [A], 
      LNode(
        LNode(
        LLeaf [G], 
        [T],
        LLeaf [C]
        ),
        [G],
        LLeaf [T]
        )
      )
    ) = Node(Node(Leaf [G], Leaf [A]), Node(Node(Leaf[G], Leaf[C]), Leaf[T]))
;; run_test "unlabel_tree multiple element tree" test


(************************* guess_parent_helix tests ***************************)

(* Here's an example test case.  Be sure to fill in the incomplete test case
 * we provided *)

let test () : bool =
  guess_parent_helix [T; C; A] [G; C; A] = [A; C; A]
;; run_test "guess_parent_helix one difference" test

let test () : bool =
  guess_parent_helix [A; C; G; G; T; A; C]
    [C; T; G; C; T; A; A] = [A; A; G; A; T; A; A]
;; run_test "guess_parent_helix multiple differences" test

let test () : bool =
  guess_parent_helix [A; C; G; G; T; A; C]
    [A; C; G; G; T; A; C] = [A; C; G; G; T; A; C]
;; run_test "guess_parent_helix no difference" test


(************************ add_ancestor_labels tests ***************************)

(* Here's an example test case.  Be sure to fill in the incomplete test cases
 * we provided and don't forget to add your own test cases! *)

let test () : bool =
  add_ancestor_labels (Node (Leaf [T], Leaf [G])) =
  LNode (LLeaf [T], [A], LLeaf [G])
;; run_test "add_ancestor_labels depth-2 tree" test

let test () : bool =
  add_ancestor_labels (Node (Leaf [T; C], Leaf [T; C])) = 
  LNode (LLeaf [T; C], [T; C], LLeaf [T; C])
;; run_test "add_ancestor_labels also depth-2 tree" test

let test () : bool =
  add_ancestor_labels (Leaf [T; C]) = LLeaf [T; C]
;; run_test "add_ancestor_labels leaf" test

let test () : bool =
  add_ancestor_labels (Node (Leaf [T], Node (Leaf [A], Leaf [G]))) =
  LNode (LLeaf[T], [A], LNode (LLeaf[A], [A], LLeaf [G]))
;; run_test "add_ancestor_labels depth-3 tree" test

let test () : bool =
  add_ancestor_labels (Node (Node (Node (Leaf [A], Leaf [T]), Leaf[G]), 
  Node (Leaf [A], Leaf [G]))) =
  (LNode (LNode (LNode (LLeaf [A], [A], LLeaf [T]), [A], LLeaf[G]), [A], 
  LNode (LLeaf [A], [A], LLeaf [G])))
;; run_test "add_ancestor_labels depth-4 tree" test



(************************ parent_child_hamming tests **************************)

(* Here we give you one example test.  Add your own tests--we will grade the
 * test cases for this problem.  Be sure to test for trees of greater depth. *)

let test () : bool =
  parent_child_hamming (LNode (LLeaf [T], [A], LLeaf [G])) = 2
;; run_test "parent_child_hamming depth-2 tree, all different" test

let test () : bool =
  parent_child_hamming (LNode (LLeaf [A], [A], LLeaf [A])) = 0
;; run_test "parent_child_hamming depth-2 tree, all same" test

let test () : bool =
  parent_child_hamming (LLeaf[A]) = 0
;; run_test "parent_child_hamming singular leaf" test

let test () : bool =
  parent_child_hamming (LNode (LLeaf [T], [A], 
  LNode (LLeaf [A], [G], LLeaf [G]))) = 3
;; run_test "parent_child_hamming depth-3 tree" test



(**************************** simplest_tree tests *****************************)

(* Here are two example test cases. Don't forget to add your own test cases!
 *
 * Note: If you want to write a test that fails on purpose, then you can use
 * run_failing_test. run_failing_test will fail if the function returns true or 
 * false, and will pass if the function throws an error *)

let test () : bool =
  simplest_tree [] = (LLeaf [], 0)
;; run_failing_test "simplest_tree empty" test

let test () : bool =
  let t1 = LNode (LLeaf [A], [T], LLeaf [C]) in
  let t2 = LNode (
               LLeaf [G; T],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in
  simplest_tree [t1; t2] = (t1, 2)
;; run_test "simplest_tree two tree list" test

let test () : bool =
  let t1 = LNode (LLeaf [A], [T], LLeaf [C]) in
  let t2 = LNode (LLeaf [A], [T], LLeaf [C]) in
  simplest_tree [t1; t2] = (t1, 2)
;; run_test "simplest_tree two equal tree list" test

let test () : bool =
  let t1 = LNode (LLeaf [A], [T], LLeaf [C]) in
  let t2 = LNode (
               LLeaf [G; T],
               [A; T],
               LNode (
                   LLeaf [T; T], 
                   [T; T], 
                   LLeaf [C; G]
               )
           ) in 
  let t3 = LNode (LLeaf [T], [A], LNode (LLeaf [A], [G], LLeaf [G])) in
  simplest_tree [t1; t2; t3] = (t1, 2)
;; run_test "simplest_tree three tree list" test



(********************* simplest_greater_ape_tree tests ************************)

(* Refactoring is the process of rewriting your code to make it simpler and
 * more general without changing its behavior. Therefore, it is easy to write
 * test cases for the new version---they should compute the same answers
 * that we did before. Because of this, we don't have to write any new test
 * cases! *)

let test () : bool =
  find_simplest_tree gorilla human chimpanzee orangutan =
  simplest_greater_ape_tree ()
;; run_test "simplest_greater_ape_tree" test

let test () : bool =
  find_simplest_tree lar_gibbon pileated_gibbon siamang white_cheeked_gibbon =
  simplest_lesser_ape_tree ()
;; run_test "simplest_lesser_ape_tree" test

;; print_endline "dnaTest.ml: ran to completion."
