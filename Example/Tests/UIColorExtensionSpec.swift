// https://github.com/Quick/Quick

import Quick
import Nimble
import Colortools

class UIColorExtensionsSpec: QuickSpec {
    override func spec() {
        describe("returning values") {
          let testColor = UIColor.init(hue: 0.4, saturation: 0.5, brightness: 0.6, alpha: 1.0)
          it("returns a tuple containing hue, saturation, and brightness") {
            expect(testColor.hsb()?.hue).to(beCloseTo(0.4, within: 0.001))
            expect(testColor.hsb()?.saturation).to(beCloseTo(0.5, within: 0.001))
            expect(testColor.hsb()?.brightness).to(beCloseTo(0.6, within: 0.001))
          }
        }
    }
}
