import optics

struct User: Equatable {
  let id: Int
  let location: Location

  static let _id = Lens<User, Int>(
    view: { $0.id },
    set: { User(id: $0, location: $1.location) }
  )

  static let _location = Lens<User, Location>(
    view: { $0.location },
    set: { User(id: $1.id, location: $0) }
  )
}

func == (lhs: User, rhs: User) -> Bool {
  return lhs.id == rhs.id && lhs.location == rhs.location
}

struct Location: Equatable {
  let id: Int
  let city: City

  static let _id = Lens<Location, Int>(
    view: { $0.id },
    set: { Location(id: $0, city: $1.city) }
  )

  static let _city = Lens<Location, City>(
    view: { $0.city },
    set: { Location(id: $1.id, city: $0) }
  )
}

func == (lhs: Location, rhs: Location) -> Bool {
  return lhs.id == rhs.id && lhs.city == rhs.city
}

struct City: Equatable {
  let id: Int

  static let _id = Lens<City, Int>(
    view: { $0.id },
    set: { (id, _) in City(id: id) }
  )
}

func == (lhs: City, rhs: City) -> Bool {
  return lhs.id == rhs.id
}
