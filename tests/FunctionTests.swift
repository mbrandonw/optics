import XCTest
@testable import optics

private let square: Int -> Int = { $0 * $0 }
private let incr: Int -> Int = { $0 + 1 }

final class FunctionTests: XCTestCase {

  func testPipeForwardOperator() {
    XCTAssertEqual(17, 4 |> square |> incr)
    XCTAssertEqual(25, 4 |> incr |> square)
  }

  func testSemigroupOperator() {
    XCTAssertEqual(17, (square <> incr)(4))
    XCTAssertEqual(25, (incr <> square)(4))
  }

  func testPrecedence() {
    XCTAssertEqual(17, 4 |> square <> incr)
    XCTAssertEqual(25, 4 |> incr <> square)
  }
}
