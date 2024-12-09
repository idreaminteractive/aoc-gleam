import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  todo
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let ins = string.to_graphemes(instructions)
  move_cmd(ins, Robot(direction, position))
}

fn move_cmd(instructions: List(String), robot: Robot) -> Robot {
  case instructions {
    [cmd, ..rest] ->
      case cmd {
        "R" -> move_cmd(rest, robot)
        "L" -> move_cmd(rest, robot)
        "A" -> move_cmd(rest, robot)
        _ -> move_cmd(rest, robot)
      }
    [] -> robot
  }
}
