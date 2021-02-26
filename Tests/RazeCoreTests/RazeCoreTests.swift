import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {
    
    func testRedColorEqual() {
        let color = RazeCore.colorFromHexString(hexString: "FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testRazeColorEqual() {
        let color = RazeCore.colorFromHexString(hexString: "450998")
        XCTAssertEqual(color, RazeCore.razeColor)
    }
    
    func testSecondaryRazeColor() {
        let color = RazeCore.colorFromHexString(hexString: "ABCDEF")
        XCTAssertEqual(color, RazeCore.secondaryColor)
    }

    static var allTests = [
        ("testRedColorEqual", testRedColorEqual),
        ("testRazeColorEqual", testRazeColorEqual),
        ("testSecondaryRazeColor", testSecondaryRazeColor),
    ]
}
