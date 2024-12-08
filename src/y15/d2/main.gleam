import gleam/io
import gleam/string
import simplifile

pub fn main() {
  let file_path = "./src/y15/d2/input.txt"

  // let input = "()((((((())))))))"
  let assert Ok(input) = simplifile.read(from: file_path)
  let lines = string.split(input, on: "\n")
}
