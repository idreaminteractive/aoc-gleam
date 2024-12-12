import data/data
import gleam/io

pub fn main() {
  data.to_tree([4]) |> io.debug
}
