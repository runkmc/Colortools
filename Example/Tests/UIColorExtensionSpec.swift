// https://github.com/Quick/Quick

import Quick
import Nimble
import Colortools

class UIColorExtensionsSpec: QuickSpec {
    override func spec() {
      describe("returning values") {
          
          it("returns a tuple containing hue, saturation, brightness, and alpha") {
            let testColor = UIColor.init(hue: 0.4, saturation: 0.5, brightness: 0.6, alpha: 1.0)
            
            expect(testColor.getHsba()?.hue).to(beCloseTo(0.4, within: 0.001))
            expect(testColor.getHsba()?.saturation).to(beCloseTo(0.5, within: 0.001))
            expect(testColor.getHsba()?.brightness).to(beCloseTo(0.6, within: 0.001))
            expect(testColor.getHsba()?.alpha).to(beCloseTo(1.0, within: 0.001))
          }
          
          it("returns a tuple containing red, blue, green, and alpha") {
            let testColor = UIColor.init(red: 0.3, green: 0.4, blue: 0.5, alpha: 0.6)
            
            expect(testColor.getRgba()?.red).to(beCloseTo(0.3, within: 0.001))
            expect(testColor.getRgba()?.blue).to(beCloseTo(0.5, within: 0.001))
            expect(testColor.getRgba()?.red).to(beCloseTo(0.3, within: 0.001))
            expect(testColor.getRgba()?.red).to(beCloseTo(0.3, within: 0.001))
          }
          
          it("returns greyscale values") {
            let testColor = UIColor.init(white: 0.7, alpha: 0.3)
            
            expect(testColor.getGreyscale()?.white).to(beCloseTo(0.7, within: 0.001))
            expect(testColor.getGreyscale()?.alpha).to(beCloseTo(0.3, within: 0.001))
          }
        
          it("returns individual components") {
            let hsbaColor = UIColor.init(hue: 0.1, saturation: 0.2, brightness: 0.3, alpha: 0.4)
            let rgbaColor = UIColor.init(red: 0.5, green: 0.6, blue: 0.7, alpha: 0.8)
            let greyColor = UIColor.init(white: 0.9, alpha: 1.0)
            
            expect(hsbaColor.hue).to(beCloseTo(0.1, within: 0.001))
            expect(hsbaColor.saturation).to(beCloseTo(0.2, within: 0.001))
            expect(hsbaColor.brightness).to(beCloseTo(0.3, within: 0.001))
            expect(hsbaColor.alpha).to(beCloseTo(0.4, within: 0.001))
            
            expect(rgbaColor.red).to(beCloseTo(0.5, within: 0.001))
            expect(rgbaColor.green).to(beCloseTo(0.6, within: 0.001))
            expect(rgbaColor.blue).to(beCloseTo(0.7, within: 0.001))
            expect(rgbaColor.alpha).to(beCloseTo(0.8, within: 0.001))
            
            expect(greyColor.white).to(beCloseTo(0.9, within: 0.001))
          }
        }
      
      describe("lighten and scale lighten") {
        let hsbColor = UIColor.init(hue: 0.5, saturation: 0.5, brightness: 0.5, alpha: 0.5)
        let greyColor = UIColor.init(white: 0.5, alpha:0.5)
       
        it("lightens a color") {
          let testColor = hsbColor.lighten(0.2)
          expect(testColor.getHsba()?.brightness).to(beCloseTo(0.7, within: 0.001))
        }
        
        it("should cap lighten at 1.0") {
          let testColor = hsbColor.lighten(0.8)
          expect(testColor.getHsba()?.brightness).to(beCloseTo(1.0, within: 0.001))
        }
        
        it("should lighten a greyscale color") {
          let testColor = greyColor.lighten(0.3)
          expect(testColor.getGreyscale()?.white).to(beCloseTo(0.8, within: 0.001))
        }
        
        it("should scaleLighten a color") {
          let testColor = hsbColor.scaleLighten(0.5)
          expect(testColor.getHsba()?.brightness).to(beCloseTo(0.75, within: 0.001))
        }
        
        it("should scaleLighten a greyscale color") {
          let testColor = greyColor.scaleLighten(0.2)
          expect(testColor.getGreyscale()?.white).to(beCloseTo(0.6, within: 0.001))
        }
      }
      
      describe("darken and scale darken") {
        let hsbColor = UIColor.init(hue: 0.6, saturation: 0.6, brightness: 0.6, alpha: 0.6)
        let greyColor = UIColor.init(white: 0.6, alpha:0.6)
        
        it ("should darken a color") {
          let testColor = hsbColor.darken(0.4)
          expect(testColor.brightness).to(beCloseTo(0.2, within: 0.001))
        }
        
        it("should scaleDarken a color") {
          let testColor = greyColor.scaleDarken(0.5)
          expect(testColor.brightness).to(beCloseTo(0.3, within: 0.001))
        }
      }
      
      describe("tint and shade") {
        let rgbaColor = UIColor.init(red: 0.3, green: 0.5, blue: 0.7, alpha: 1.0)
        
        it("can tint a color") {
          let testColor = rgbaColor.tint(0.3)
          expect(testColor.red).to(beCloseTo(0.6, within: 0.001))
          expect(testColor.blue).to(beCloseTo(1.0, within: 0.0001))
        }
        
        it("can shade a color") {
          let testColor = rgbaColor.shade(0.5)
          expect(testColor.red).to(beCloseTo(0.0, within: 0.001))
          expect(testColor.blue).to(beCloseTo(0.2, within: 0.001))
        }
      }
      
      describe("saturate and desaturate") {
        let hsbaColor = UIColor.init(hue: 0.3, saturation: 0.5, brightness: 0.8, alpha: 1.0)
        
        it("can saturate a color") {
          let testColor = hsbaColor.saturate(0.3)
          let oversaturate = hsbaColor.saturate(0.9)
          
          expect(testColor?.saturation).to(beCloseTo(0.8, within: 0.001))
          expect(oversaturate?.saturation).to(beCloseTo(1.0, within: 0.001))
        }
      }
    }
}
