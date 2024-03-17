import XCTest
import SwiftUI
@testable import CoffeeFactorySwift

final class CoffeeFactorySwiftTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CFAspectRatio.fiveToFour.calcSize(from: 200).height, 200 * 4 / 5)
    }
    
    func testCGFloat() throws {
//        XCTAssertEqual(CGFloat.spacing100, 200)
    }
}
