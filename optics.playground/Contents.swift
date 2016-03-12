import optics
import UIKit

let add: CGFloat -> CGFloat -> CGFloat = { a in { a + $0 } }
let scale: CGFloat -> CGFloat -> CGFloat = { s in { s * $0 } }

let baseStyle = UIButton._titleColor(.Normal) *~ .redColor()
  <> UIButton._titleText(.Normal) *~ "Howdy!"
  <> UIView._backgroundColor *~ .blueColor()
  <> UIView._frame *~ CGRect(x: 20.0, y: 20.0, width: 100.0, height: 50.0)
  <> UIView._frame • CGRect._size • CGSize._width %~ add(50.0)
  <> UIView._frame • CGRect._size • CGSize._height %~ scale(0.5)
  <> UIView._layer • CALayer._cornerRadius *~ 10.0
  <> UIView._layer • CALayer._masksToBounds *~ true

let holder = UIView(frame: .unit)
  |> UIView._backgroundColor *~ .brownColor()
  <> UIView._frame • CGRect._size *~ CGSize(width: 200.0, height: 200.0)

let circleStyle = UIView._frame • CGRect._size • CGSize._width *~ 100.0
  <> UIView._frame • CGRect._size • CGSize._height *~ 100.0
  <> UIView._layer • CALayer._cornerRadius *~ 50.0
  <> UIView._layer • CALayer._masksToBounds *~ true

let button = UIButton(frame: .unit)
  |> baseStyle
  |> circleStyle

holder.addSubview(button)

