import class UIKit.UIButton

extension UIButton {

  public static let _titleLabel = Lens<UIButton, UILabel>(
    view: { $0.titleLabel! },
    set: { _, button in button }
  )

  public static func _titleText(state: UIControl.State) -> Lens<UIButton, String> {
    return Lens(
      view: { $0.title(for: state) ?? "" },
      set: { $1.setTitle($0, for: state); return $1 }
    )
  }

  public static func _titleColor(state: UIControl.State) -> Lens<UIButton, UIColor> {
    return Lens(
      view: { $0.titleColor(for: state) ?? .clear },
      set: { $1.setTitleColor($0, for: state); return $1 }
    )
  }
}
