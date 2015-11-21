import UIKit

extension UIColor {
  
  /// Returns the hue of a UIColor
  public var hue: Double? {
    return self.getHsba()?.hue
  }
  
  /// Returns the saturation of a UIColor
  public var saturation: Double? {
    return self.getHsba()?.saturation
  }
  
  /// Returns the brightness of a UIColor
  public var brightness: Double? {
    return self.getHsba()?.brightness
  }
  
  /// Returns the alpha value of a UIColor
  public var alpha: Double? {
    return self.getHsba()?.alpha
  }
  
  /// Returns the red value of a UIColor
  public var red: Double? {
    return self.getRgba()?.red
  }
  
  /// Returns the green value of a UIColor
  public var green: Double? {
    return self.getRgba()?.green
  }
  
  /// Returns the blue value of a UIColor
  public var blue: Double? {
    return self.getRgba()?.blue
  }
  
  /// Returns the white value of a greyscale UIColor
  public var white: Double? {
    return self.getGreyscale()?.white
  }
  
  /** This takes a hexadecimal number of RRGGBBAA format. Observe:

	  let green = UIColor.init(hex:0x00FF00FF)
	  let semiTransparentRed = UIColor.init(hex:0xFF000088)
	  let orange = UIColor.init(hex:0xF27935FF)

	And so on. */
  public convenience init(hex:UInt32) {
    let red = (hex & 0xFF000000) >> 24
    let green = (hex & 0x00FF0000) >> 16
    let blue = (hex & 0x0000FF00) >> 8
    let alpha = hex & 0x000000FF
    
    self.init(red: CGFloat(Float(red)/255), green: CGFloat(Float(green)/255), blue: CGFloat(Float(blue)/255), alpha: CGFloat(Float(alpha)/255))
  }

  /// Returns an optional tuple with the named HSBA components
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

  /// Returns an optional tuple with the named RGBA components
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
  
  /// Returns an optional tuple with the named greyscale components
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
  
  /// Returns an optional UIColor with the brightness raised by a number between 0.0 and 1.0
  public func lighten(amount:Double) -> UIColor? {
    if let values = self.getHsba() {
      return UIColor.init(hue: CGFloat(values.hue),
        saturation: CGFloat(values.saturation),
        brightness: CGFloat(values.brightness + amount),
        alpha: CGFloat(values.alpha))
      } else {
        return nil
    }
  }

  /** Returns an optional UIColor with the brightness raised a percentage of the
  way to 1.0. (i.e. scaleLighten(0.5) on a UIColor with a brightness of 0.5 will
  return a UIColor with a brightness of 0.75 -- 50% of the way to 1.0 */
  public func scaleLighten(amount:Double) -> UIColor? {
    if let values = self.getHsba() {
      return UIColor.init(hue: CGFloat(values.hue),
        saturation: CGFloat(values.saturation),
        brightness: CGFloat(values.brightness + (values.brightness * amount)),
        alpha: CGFloat(values.alpha))
      } else { return nil
    }
  }
  
  /// The opposite of lighten
  public func darken(amount:Double) -> UIColor? {
    return self.lighten((amount * -1))
  }

  /// The opposite of scaleLighten 
  public func scaleDarken(amount:Double) -> UIColor? {
    return self.scaleLighten((amount * -1))
  }
  
  /** Takes a double between 0.0 and 1.0, and adds the corresponding amount of
  white to the color. This is kind of like lighten, but different */
  public func tint(amount:Double) -> UIColor? {
    if let rgb = self.getRgba() {
      return UIColor.init(red: CGFloat(rgb.red + amount),
        green: CGFloat(rgb.green + amount),
        blue: CGFloat(rgb.blue + amount),
        alpha: CGFloat(rgb.alpha))
    } else {
      return nil
    }
  }
  
  /// The opposite of tint, this adds black to a color
  public func shade(amount:Double) -> UIColor? {
    return self.tint((amount * -1))
  }
  
  /// Takes a double between 0.0 and 1.0 and raises the saturation accordingly
  public func saturate(amount:Double) -> UIColor? {
    if let hsb = self.getHsba() {
      return UIColor.init(hue: CGFloat(hsb.hue),
        saturation: CGFloat(hsb.saturation + amount),
        brightness: CGFloat(hsb.brightness),
        alpha: CGFloat(hsb.alpha))
    } else {
      return nil
    }
  }
 
  /// The opposite of saturate  
  public func desaturate(amount:Double) -> UIColor? {
    return self.saturate((amount * -1))
  }
}
