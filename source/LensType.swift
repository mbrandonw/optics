public protocol LensType {
  typealias Whole
  typealias Part

  init(view: Whole -> Part, set: (Part, Whole) -> Whole)

  var view: Whole -> Part { get }
  var set: (Part, Whole) -> Whole { get }
}

public extension LensType {
  public func over(f: Part -> Part) -> Whole -> Whole {
    return { a in self.set(f(self.view(a)), a) }
  }

  public func compose <RLens: LensType where RLens.Whole == Part>(rhs: RLens) -> Lens<Whole, RLens.Part> {

      return Lens(
        view: { a in rhs.view(self.view(a)) },
        set: { (c, a) in self.set(rhs.set(c, self.view(a)), a) }
      )
  }
}

public func *~ <L: LensType> (lens: L, b: L.Part) -> L.Whole -> L.Whole {
  return { a in lens.set(b, a) }
}

public func ^* <L: LensType> (a: L.Whole, lens: L) -> L.Part {
  return lens.view(a)
}

public func • <A, B, C> (lhs: Lens<A, B>, rhs: Lens<B, C>) -> Lens<A, C> {
  return lhs.compose(rhs)
}

public func %~ <L: LensType> (lens: L, f: L.Part -> L.Part) -> L.Whole -> L.Whole {
  return lens.over(f)
}
