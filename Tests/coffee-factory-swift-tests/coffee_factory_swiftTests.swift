import XCTest
import SwiftUI
@testable import CoffeeFactorySwift

final class CoffeeFactorySwiftTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CoffeeFactorySwift().text, "Hello, World!")
    }
    
    func testCGFloat() throws {
        XCTAssertEqual(CGFloat.spacing100, 200)
    }
}

