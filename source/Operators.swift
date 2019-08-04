
// Function application
precedencegroup A {
  associativity: left
  higherThan: AdditionPrecedence
}

infix operator |> : A

// Semigroup operation
precedencegroup B {
  associativity: left
  higherThan: A
}
infix operator <> : B

// Lens set
precedencegroup C {
  associativity: left
  higherThan: B
}
infix operator *~ : C

// Lens view
infix operator ^* : A

// Lens over
infix operator %~ : C

// Lens composition
precedencegroup D {
  associativity: left
  higherThan: C
}
infix operator • : D
