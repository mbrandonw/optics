
public func |> <A, B> (x: A, f: A -> B) -> B {
  return f(x)
}

public func <> <A, B, C> (f: A -> B, g: B -> C) -> A -> C {
  return { g(f($0)) }
}
