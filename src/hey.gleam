import gleam/list
import gleam/option

import gleam/regex

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("[(INFO|DEBUG|ERROR|WARNING)] .*")
  regex.check(re, line)
}

// log_parser.split_line("[INFO] Start.<*>[INFO] Processing...<~~~>[INFO] Success.")
// -> ["[INFO] Start.", "[INFO] Processing...", "[INFO] Success."]
pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[~*=-]*>")
  regex.split(re, line)
}

// log_parser.tag_with_user_name("[INFO] User Alice created a new project")
// -> "[USER] Alice [INFO] User Alice created a new project"
pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("[\\S*].*? User (.*?)\\w*")
  let assert Ok(m) = regex.scan(re, line) |> list.last
  let assert Ok(option.Some(user)) = m.submatches |> list.last

  "[USER] " <> user <> " " <> line
}
// pub fn main() {
//   tag_with_user_name("[INFO] User Alice created a new project")
// }
