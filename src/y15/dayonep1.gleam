import gleam/io
import gleam/string
import simplifile

pub fn main() {
  let file_path = "./src/fifteen/dayone.input"

  // let input = "()((((((())))))))"
  let assert Ok(input) = simplifile.read(from: file_path)

  let l = string.to_graphemes(input)

  recurse(l, 0, 0) |> io.debug
}

fn recurse(list: List(String), floor_val: Int, position: Int) -> Int {
  case list {
    [] -> position
    [first, ..rest] -> {
      case first {
        ")" if floor_val == 0 -> position + 1
        "(" -> recurse(rest, 1 + floor_val, position + 1)
        ")" -> recurse(rest, floor_val - 1, position + 1)
        _ -> 0
      }
    }
  }
}
