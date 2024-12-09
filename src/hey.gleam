import gleam/list

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && num_sides_equal(a, b, c) == 3
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && num_sides_equal(a, b, c) >= 2
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && num_sides_equal(a, b, c) == 0
}

fn num_sides_equal(a: Float, b: Float, c: Float) -> Int {
  let num =
    [a == b, b == c, c == a]
    |> list.count(fn(x) { x })
  case num {
    1 -> 2
    2 | 3 -> 3
    _ -> 0
  }
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  let all_zeros = a == 0.0 && b == 0.0 && c == 0.0
  a +. b >=. c && b +. c >=. a && a +. c >=. b && !all_zeros
}
