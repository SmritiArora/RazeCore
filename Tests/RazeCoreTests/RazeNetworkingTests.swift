//
//  RazeNetworkingTests.swift
//  RazeCoreTests
//
//  Created by Nineleaps on 27/02/21.
//

import XCTest
@testable import RazeCore

class NetworkSessionMock: NetworkSession {
    
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data,error)
    }
}

final class RazeNetworkingTests: XCTestCase {
    
    func testLoadDataCall() {
        let manager = RazeCore.Networking.Manager()
        let session = NetworkSessionMock()
        //point of injection
        manager.session = session
        let expectation = XCTestExpectation(description: "Load Data called")
        
        let data = Data([1,0,1,0])
        
        session.data = data
        
        let url = URL(fileURLWithPath: "url")
      
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let obtainedData):
                XCTAssertEqual(data, obtainedData, "Manager Returned unexpected data")
            case .failure(let error): XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    static var allTests = [
        ("testLoadDataCall", testLoadDataCall)
    ]
    
}
