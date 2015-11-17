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
    
    if self.getHue(hue, saturation: saturation, brightness: brightness, alpha: alpha) == true {
      return (hue: Double(hue.memory), saturation: Double(saturation.memory), brightness: Double(brightness.memory))
    } else {
      return nil
    }
  }
}