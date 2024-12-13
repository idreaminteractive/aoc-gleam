import data/data
import gleam/int
import gleam/io

pub fn main() {
  int.bitwise_shift_right(4, 4) |> io.debug
}
