import class UIKit.UIButton

extension UIButton {

  public static let _titleLabel = Lens<UIButton, UILabel>(
    view: { $0.titleLabel! },
    set: { _, button in button }
  )

  public static func _titleText(state: UIControlState) -> Lens<UIButton, String> {
    return Lens(
      view: { $0.titleForState(state) ?? "" },
      set: { $1.setTitle($0, forState: state); return $1 }
    )
  }

  public static func _titleColor(state: UIControlState) -> Lens<UIButton, UIColor> {
    return Lens(
      view: { $0.titleColorForState(state) ?? .clearColor() },
      set: { $1.setTitleColor($0, forState: state); return $1 }
    )
  }
}
