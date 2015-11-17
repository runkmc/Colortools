import UIKit

extension UIColor {
  
  public func hsb() -> (hue:Double, saturation:Double, brightness:Double)? {
    let hue = UnsafeMutablePointer<CGFloat>.alloc(1)
    let brightness = UnsafeMutablePointer<CGFloat>.alloc(1)
    let saturation = UnsafeMutablePointer<CGFloat>.alloc(1)
    let alpha = UnsafeMutablePointer<CGFloat>.alloc(1)
    
    hue.initialize(0.0)
    brightness.initialize(0.0)
    saturation.initialize(0.0)
    alpha.initialize(0.0)
    
    var values: (hue:Double, saturation:Double, brightness:Double)?
    if self.getHue(hue, saturation: saturation, brightness: brightness, alpha: alpha) == true {
      values = (hue: Double(hue.memory), saturation: Double(saturation.memory), brightness: Double(brightness.memory))
    } else {
      values = nil
    }
    hue.destroy(1)
    hue.dealloc(1)
    brightness.destroy(1)
    brightness.dealloc(1)
    saturation.destroy(1)
    saturation.dealloc(1)
    alpha.destroy(1)
    alpha.dealloc(1)
    
    return values
  }
}