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

fn advance()

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
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
        "R" -> {
          case robot.direction {
            East -> move_cmd(rest, Robot(..robot, direction: South))
            West -> move_cmd(rest, Robot(..robot, direction: North))
            North -> move_cmd(rest, Robot(..robot, direction: East))
            South -> move_cmd(rest, Robot(..robot, direction: West))
          }
        }
        "L" -> {
          case robot.direction {
            East -> move_cmd(rest, Robot(..robot, direction: North))
            West -> move_cmd(rest, Robot(..robot, direction: South))
            North -> move_cmd(rest, Robot(..robot, direction: West))
            South -> move_cmd(rest, Robot(..robot, direction: East))
          }
        }
        "A" -> {
          case robot.direction {
            East -> move_cmd(rest, Robot(..robot, position:))
            West -> move_cmd(rest, Robot(..robot, direction: South))
            North -> move_cmd(rest, Robot(..robot, direction: West))
            South -> move_cmd(rest, Robot(..robot, direction: East))
          }
        }
        _ -> move_cmd(rest, robot)
      }
    [] -> robot
  }
}
