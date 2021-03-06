//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class ApplicationTests: XCTestCase {
	// MARK: Forward function application

	func testForwardUnaryFunctionApplication() {
		let digits = 100 |> toString |> countElements
		XCTAssertEqual(digits, 3)
	}

	func testForwardBinaryFunctionApplication() {
		XCTAssertEqual((1, 2) |> (+), 3)
	}

	func testForwardPipelineWithMixedArity() {
		let digits = (75, 25) |> (+) |> toString |> countElements
		XCTAssertEqual(digits, 3)
	}


	// MARK: Backward function application

	func testBackwardUnaryFunctionApplication() {
		let digits = countElements <| toString <| 100
		XCTAssertEqual(digits, 3)
	}

	func testBackwardBinaryFunctionApplication() {
		XCTAssertEqual((+) <| (1, 2), 3)
	}

	func testBackwardPipelineWithMixedArity() {
		let digits = countElements <| toString <| (+) <| (75, 25)
		XCTAssertEqual(digits, 3)
	}
}
