import gleam/int
import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..] -> x
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [today, ..rest] -> [today + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  list.any(days, fn(day) { day == 0 })
}

pub fn total(days: List(Int)) -> Int {
  list.fold(days, 0, int.add)
}

pub fn busy_days(days: List(Int)) -> Int {
  list.filter(days, fn(day) { day >= 5 })
  |> list.length
}
