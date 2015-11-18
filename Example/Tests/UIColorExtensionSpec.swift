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
          }
        }
    }
}
