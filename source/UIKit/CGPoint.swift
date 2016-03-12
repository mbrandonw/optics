import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGFloat

extension CGPoint {
  public static let _x = Lens<CGPoint, CGFloat>(
    view: { $0.x },
    set: { CGPoint(x: $0, y: $1.y) }
  )

  public static let _y = Lens<CGPoint, CGFloat>(
    view: { $0.y },
    set: { CGPoint(x: $1.x, y: $0) }
  )
}
