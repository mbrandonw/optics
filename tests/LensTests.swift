import XCTest
@testable import optics

private let square: Int -> Int = { $0 * $0 }
private let add: Int -> Int -> Int = { lhs in { lhs + $0 } }
private let incr: Int -> Int = add(1)

let user = User(id: 1, location: Location(id: 2, city: City(id: 3)))

final class LensTests: XCTestCase {

  func testLensComposition() {
    XCTAssertEqual(2, User._location.compose(Location._id).view(user))
    XCTAssertEqual(3, User._location.compose(Location._city.compose(City._id)).view(user))
  }

  func testLensCompositionOperator() {
    XCTAssertEqual(2, (User._location • Location._id).view(user))
    XCTAssertEqual(3, (User._location • Location._city • City._id).view(user))
  }

  func testLensSetOperator() {
    XCTAssertEqual(4, (User._id *~ 4)(user).id)
  }

  func testLensSetAndCompositionOperatorPrecedence() {
    XCTAssertEqual(4, (User._location • Location._id *~ 4)(user).location.id)
  }

  func testLensViewOperator() {
    XCTAssertEqual(1, user ^* User._id)
  }

  func testLensViewAndCompositionOperatorPrecedence() {
    XCTAssertEqual(2, user ^* User._location • Location._id)
  }

  func testOver() {
    XCTAssertEqual(2, User._id.over(incr)(user).id)
  }

  func testOverOperator() {
    XCTAssertEqual(2, (User._id %~ incr)(user).id)
  }

  func testOverAndCompositionOperatorPrecedence() {
    XCTAssertEqual(3, (User._location • Location._id %~ incr)(user).location.id)
  }

  func testOperatorPrecedences() {
    XCTAssertEqual(User(id: 11, location: Location(id: 12, city: City(id: 13))),
      user
        |> User._id %~ add(10)
        <> User._location • Location._id %~ square
        <> User._location • Location._id %~ add(8)
        <> User._location • Location._city • City._id *~ 13
    )

    XCTAssertEqual(13,
      user
        |> User._id %~ add(10)
        <> User._location • Location._id %~ square
        <> User._location • Location._id %~ add(8)
        <> User._location • Location._city • City._id *~ 13
        ^* User._location • Location._city • City._id
    )
  }
}
