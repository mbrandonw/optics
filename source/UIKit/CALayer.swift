import class UIKit.CALayer

extension CALayer {
  public static let _cornerRadius = Lens<CALayer, CGFloat>(
    view: { $0.cornerRadius },
    set: { $1.cornerRadius = $0; return $1 }
  )

  public static let _masksToBounds = Lens<CALayer, Bool>(
    view: { $0.masksToBounds },
    set: { $1.masksToBounds = $0; return $1 }
  )
}
