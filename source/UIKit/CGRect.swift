import struct CoreGraphics.CGRect
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGPoint

extension CGRect {
  public static let unit = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

  public static let _origin = Lens<CGRect, CGPoint>(
    view: { $0.origin },
    set: { CGRect(origin: $0, size: $1.size) }
  )

  public static let _size = Lens<CGRect, CGSize>(
    view: { $0.size },
    set: { CGRect(origin: $1.origin, size: $0) }
  )
}
