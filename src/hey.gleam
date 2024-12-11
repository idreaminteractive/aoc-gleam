import gleam/io

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  let t: Tree = Nil
  case data {
    [] -> Nil 
    [first, ..rest] 
  }
  todo
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  todo
}


pub fn main(){
  to_tree([1]) |> io.debug
}