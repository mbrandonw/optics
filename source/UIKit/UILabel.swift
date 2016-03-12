import class UIKit.UILabel

extension UILabel {
  public static let _textColor = Lens<UILabel, UIColor>(
    view: { $0.textColor },
    set: { $1.textColor = $0; return $1; }
  )
}

