import struct CoreGraphics.CGRect
import struct CoreGraphics.CGFloat

extension CGSize {
  public static let _width = Lens<CGSize, CGFloat>(
    view: { $0.width },
    set: { CGSize(width: $0, height: $1.height) }
  )

  public static let _height = Lens<CGSize, CGFloat>(
    view: { $0.height },
    set: { CGSize(width: $1.width, height: $0) }
  )
}
