import XCTest
@testable import coffee_factory_swift

final class CoffeeFactorySwiftTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CoffeeFactorySwift().text, "Hello, World!")
    }
    
    func testCGFloat() throws {
        XCTAssertEqual(CGFloat.spacing100, CoffeeFactorySwift.init().myFloat)
    }
}
