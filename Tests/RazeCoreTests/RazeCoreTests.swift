import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {
    
    func testRedColorEqual() {
        let color = RazeCore.colorFromHexString(hexString: "FF0000")
        XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testRedColorEqual", testRedColorEqual),
    ]
}
