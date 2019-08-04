import XCPlayground
import UIKit
import optics

let add: (CGFloat) -> (CGFloat) -> CGFloat = { a in { a + $0 } }
let scale: (CGFloat) -> (CGFloat) -> CGFloat = { s in { s * $0 } }

let holder = UIView()
  |> UIView._backgroundColor *~ .brown
  <> UIView._frame • CGRect._size *~ CGSize(width: 200.0, height: 200.0)
XCPlaygroundPage.currentPage.liveView = holder

let baseStyle = UIButton._titleColor(state: .normal) *~ .red
  <> UIButton._titleText(state: .normal) *~ "Howdy!"
  <> UIView._backgroundColor *~ .blue
  <> UIView._frame *~ CGRect(x: 20.0, y: 20.0, width: 100.0, height: 50.0)
  <> UIView._frame • CGRect._size • CGSize._width %~ add(50.0)
  <> UIView._frame • CGRect._size • CGSize._height %~ scale(0.5)

let circleStyle = UIView._frame • CGRect._size • CGSize._width *~ 100.0
  <> UIView._frame • CGRect._size • CGSize._height *~ 100.0
  <> UIView._layer • CALayer._cornerRadius *~ 50.0
  <> UIView._layer • CALayer._masksToBounds *~ true

let button = UIButton()
  |> baseStyle

holder.addSubview(button)

UIView.animate(withDuration: 5.0) {
  button |> circleStyle
}
