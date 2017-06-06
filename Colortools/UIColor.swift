//
//  UIColor.swift
//  Colortools
//
//  Created by Kevin McGladdery on 6/5/17.
//  Copyright © 2017 Kevin McGladdery. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Returns the hue of a UIColor
    public var hue: Double? {
        return self.getHsba()?.hue
    }
    
    /// Returns the brightness of a UIColor
    public var brightness: Double? {
        return self.getHsba()?.brightness
    }
    
    /// Returns the saturation of a UIColor
    public var saturation: Double? {
        return self.getHsba()?.saturation
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
    
    public var blue: Double? {
        return self.getRgba()?.blue
    }
    
    // Private stuff
    
    private func getHsba() -> (hue:Double, saturation:Double, brightness:Double, alpha:Double)? {
        let hue = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let brightness = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let saturation = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let alpha = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        
        hue.initialize(to: 0.0)
        brightness.initialize(to: 0.0)
        saturation.initialize(to: 0.0)
        alpha.initialize(to: 0.0)
        
        var values: (hue:Double, saturation:Double, brightness:Double, alpha:Double)?
        if self.getHue(hue, saturation: saturation, brightness: brightness, alpha: alpha) == true {
            values = (hue: Double(hue.pointee), saturation: Double(saturation.pointee), brightness: Double(brightness.pointee), alpha: Double(alpha.pointee))
        } else {
            values = nil
        }
        hue.deinitialize(count: 1)
        hue.deallocate(capacity: 1)
        brightness.deinitialize(count: 1)
        brightness.deallocate(capacity: 1)
        saturation.deinitialize(count: 1)
        saturation.deallocate(capacity: 1)
        alpha.deinitialize(count: 1)
        alpha.deallocate(capacity: 1)
        
        return values
    }
    
    public func getRgba() -> (red:Double, green:Double, blue:Double, alpha:Double)? {
        let red = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let blue = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let green = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        let alpha = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
        
        red.initialize(to: 0.0)
        blue.initialize(to: 0.0)
        green.initialize(to: 0.0)
        alpha.initialize(to: 0.0)
        
        var values: (red:Double, blue:Double, green:Double, alpha:Double)?
        if self.getRed(red, green: green, blue: blue, alpha: alpha) == true {
            values = (red: Double(red.pointee), green: Double(green.pointee), blue: Double(blue.pointee), alpha: Double(alpha.pointee))
        } else {
            values = nil
        }
        
        red.deinitialize(count: 1)
        red.deallocate(capacity: 1)
        blue.deinitialize(count: 1)
        blue.deallocate(capacity: 1)
        green.deinitialize(count: 1)
        green.deallocate(capacity: 1)
        alpha.deinitialize(count: 1)
        alpha.deallocate(capacity: 1)
        
        return values
    }

}
