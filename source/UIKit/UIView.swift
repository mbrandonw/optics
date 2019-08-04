import class UIKit.UIView
import class UIKit.CALayer

public protocol UIViewType: class {
  var backgroundColor: UIColor? { get set }
  var frame: CGRect { get set }
  var layer: CALayer { get }
}

extension UIView: UIViewType {}

extension UIViewType {

  public static var _backgroundColor: Lens<Self, UIColor> {
    return Lens(
      view: { $0.backgroundColor ?? .clear },
      set: { $1.backgroundColor = $0; return $1 }
    )
  }

  public static var _frame: Lens<Self, CGRect> {
    return Lens(
      view: { $0.frame },
      set: { $1.frame = $0; return $1 }
    )
  }

  public static var _layer: Lens<Self, CALayer> {
    return Lens(
      view: { $0.layer },
      set: { _, view in view }
    )
  }
}
