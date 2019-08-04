public protocol LensType {
  associatedtype Whole
  associatedtype Part

  init(view: @escaping (Whole) -> Part, set: @escaping (Part, Whole) -> Whole)

  var view: (Whole) -> Part { get }
  var set: (Part, Whole) -> Whole { get }
}

public extension LensType {
  func over(f: @escaping (Part) -> Part) -> (Whole) -> Whole {
    return { a in self.set(f(self.view(a)), a) }
  }

  func compose <RLens: LensType>(rhs: RLens) -> Lens<Whole, RLens.Part> where RLens.Whole == Part {

      return Lens(
        view: { a in rhs.view(self.view(a)) },
        set: { (c, a) in self.set(rhs.set(c, self.view(a)), a) }
      )
  }
}

public func *~ <L: LensType> (lens: L, b: L.Part) -> (L.Whole) -> L.Whole {
  return { a in lens.set(b, a) }
}

public func ^* <L: LensType> (a: L.Whole, lens: L) -> L.Part {
  return lens.view(a)
}

public func • <A, B, C> (lhs: Lens<A, B>, rhs: Lens<B, C>) -> Lens<A, C> {
  return lhs.compose(rhs: rhs)
}

public func %~ <L: LensType> (lens: L, f: @escaping (L.Part) -> L.Part) -> (L.Whole) -> L.Whole {
  return lens.over(f: f)
}
