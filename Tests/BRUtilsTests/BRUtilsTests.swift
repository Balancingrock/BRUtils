import XCTest
@testable import BRUtils

class BRUtilsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(BRUtils().text, "Hello, World!")
    }


    static var allTests : [(String, (BRUtilsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
