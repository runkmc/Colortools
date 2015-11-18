import UIKit

extension UIColor {
  
  public func getHsba() -> (hue:Double, saturation:Double, brightness:Double, alpha:Double)? {
    let hue = UnsafeMutablePointer<CGFloat>.alloc(1)
    let brightness = UnsafeMutablePointer<CGFloat>.alloc(1)
    let saturation = UnsafeMutablePointer<CGFloat>.alloc(1)
    let alpha = UnsafeMutablePointer<CGFloat>.alloc(1)
    
    hue.initialize(0.0)
    brightness.initialize(0.0)
    saturation.initialize(0.0)
    alpha.initialize(0.0)
    
    var values: (hue:Double, saturation:Double, brightness:Double, alpha:Double)?
    if self.getHue(hue, saturation: saturation, brightness: brightness, alpha: alpha) == true {
      values = (hue: Double(hue.memory), saturation: Double(saturation.memory), brightness: Double(brightness.memory), alpha: Double(alpha.memory))
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
  
  public func getRgba() -> (red:Double, green:Double, blue:Double, alpha:Double)? {
    let red = UnsafeMutablePointer<CGFloat>.alloc(1)
    let blue = UnsafeMutablePointer<CGFloat>.alloc(1)
    let green = UnsafeMutablePointer<CGFloat>.alloc(1)
    let alpha = UnsafeMutablePointer<CGFloat>.alloc(1)
    
    red.initialize(0.0)
    blue.initialize(0.0)
    green.initialize(0.0)
    alpha.initialize(0.0)
    
    var values: (red:Double, blue:Double, green:Double, alpha:Double)?
    if self.getRed(red, green: green, blue: blue, alpha: alpha) == true {
      values = (red: Double(red.memory), green: Double(green.memory), blue: Double(blue.memory), alpha: Double(alpha.memory))
    } else {
      values = nil
    }
    
    red.destroy(1)
    red.dealloc(1)
    blue.destroy(1)
    blue.dealloc(1)
    green.destroy(1)
    green.dealloc(1)
    alpha.destroy(1)
    alpha.dealloc(1)
    
    return values
  }
  
  public func getGreyscale() -> (white:Double, alpha:Double)? {
    let white = UnsafeMutablePointer<CGFloat>.alloc(1)
    let alpha = UnsafeMutablePointer<CGFloat>.alloc(1)
    
    white.initialize(0.0)
    alpha.initialize(0.0)
    
    var values: (white:Double, alpha:Double)?
    if self.getWhite(white, alpha: alpha) == true {
      values = (white: Double(white.memory), alpha: Double(alpha.memory))
    } else {
      values = nil
    }
    
    white.destroy(1)
    white.dealloc(1)
    alpha.destroy(1)
    alpha.dealloc(1)
    
    return values
  }
  
  public func lighten(amount:Double) -> UIColor {
    if let values = self.getHsba() {
    return UIColor.init(hue: CGFloat(values.hue),
      saturation: CGFloat(values.saturation),
      brightness: CGFloat(values.brightness + amount),
      alpha: CGFloat(values.alpha))
    } else {
      return self
    }
  }
  
}