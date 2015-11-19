# Colortools

[![Version](https://img.shields.io/cocoapods/v/Colortools.svg?style=flat)](http://cocoapods.org/pods/Colortools)
[![License](https://img.shields.io/cocoapods/l/Colortools.svg?style=flat)](http://cocoapods.org/pods/Colortools)
[![Platform](https://img.shields.io/cocoapods/p/Colortools.svg?style=flat)](http://cocoapods.org/pods/Colortools)

## Usage

Colortools adds some methods and properties to UIColor. Let's look at the
properties!

```swift
public var hue: Double?  // Returns a UIColor's hue
  
public var saturation: Double?  // Returns a UIColor's saturation
  
public var brightness: Double?  // Returns a UIColor's brightness

public var alpha: Double?  // Returns a UIColor's alpha value

public var red: Double?  // Returns a UIColor's red component

public var green: Double?  // Returns a UIColor's green component

public var blue: Double?  // Returns a UIColor's blue component

public var white: Double?  // Returns a UIColor's white component, if it's a greyscale UIColor.
```

But what about the methods? CHECK THESE OUT:

```swift
public func getHsba() -> (hue:Double, saturation:Double, brightness:Double, alpha:Double)?
// Returns an optional tuple with the named HSBA components

public func getRgba() -> (red:Double, green:Double, blue:Double, alpha:Double)?
// Returns an optional tuple with the named RGBA components

public func getGreyscale() -> (white:Double, alpha:Double)?
// Returns an optional tuple with the named greyscale components

public func lighten(amount:Double) -> UIColor?
// Returns an optional UIColor with the brightness raised by a number between 0.0 and 1.0

public func scaleLighten(amount:Double) -> UIColor?
// Returns an optional UIColor with the brightness raised a percentage of the
// way to 1.0. (i.e. scaleLighten(0.5) on a UIColor with a brightness of 0.5 will
// return a UIColor with a brightness of 0.75 -- 50% of the way to 1.0

public func darken(amount:Double) -> UIColor?
// The opposite of lighten

public func scaleDarken(amount:Double) -> UIColor?
// The opposite of scaleLighten

public func tint(amount:Double) -> UIColor?
// Takes a double between 0.0 and 1.0, and adds the corresponding amount of
// white to the color. This is kind of like lighten, but different. Try it.

public func shade(amount:Double) -> UIColor?
// The opposite of tint, this adds black to a color

public func saturate(amount:Double) -> UIColor?
// Takes a double between 0.0 and 1.0 and raises the saturation accordingly

public func desaturate(amount:Double) -> UIColor?
// The opposite of saturate

public convenience init(hex:UInt32) 
// This takes a hexadecimal number of RRGGBBAA format. Observe:

let green = UIColor.init(hex:0x00FF00FF)
let semiTransparentRed = UIColor.init(hex:0xFF000088)
let orange = UIColor.init(hex:0xF27935FF)

// And so on.
```

To run the tests, clone the repo, and run `pod install` from the Example directory first.

## Installation

Colortools is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Colortools"
```

## Author

Kevin McGladdery, kevin.mcgladdery@gmail.com

## License

Colortools is available under the MIT license. See the LICENSE file for more info.
