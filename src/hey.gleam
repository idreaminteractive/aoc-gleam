import data/data
import gleam/io

pub fn main() {
  data.sorted_data([2]) |> io.debug
}
