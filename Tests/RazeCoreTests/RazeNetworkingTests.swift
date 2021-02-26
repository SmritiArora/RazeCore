//
//  RazeNetworkingTests.swift
//  RazeCoreTests
//
//  Created by Nineleaps on 27/02/21.
//

import XCTest
@testable import RazeCore

final class RazeNetworkingTests: XCTestCase {
    
    func testLoadDataCall() {
        let manager = RazeCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Load Data called")
        guard let url = URL(string: "abcd") else {
            return XCTFail("Couldn't create URL")
        }
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let obtainedData): XCTAssertNotNil(obtainedData, "Response Data is nil")
            case .failure(let error): XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    static var allTests = [
        ("testLoadDataCall", testLoadDataCall)
    ]
    
}
