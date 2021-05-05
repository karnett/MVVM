//
//  ViewModelTests.swift
//  MVVMTests
//
//  Created by karnett on 4/30/21.
//

import Foundation
import XCTest
@testable import MVVM

class ViewModelTests: XCTestCase {
    func testViewModel() {

        let data = [Todo(userId: 1, id: 1, title: "My Todo Item", completed: false)]
        let mockNetwork = MockNetwork(data: try? JSONEncoder().encode(data), error: nil)

        let viewModel = ViewModel(delegate: nil, network: mockNetwork)
        XCTAssertEqual(viewModel.getNumberOfRows(), 1)
    }
}



class MockNetwork: Network {
    let dataToReturn: Data?
    let errorToReturn: Error?

    init(data: Data? = nil, error: Error? = nil) {
        self.dataToReturn = data
        self.errorToReturn = error
    }

    func request(url: String, completion: @escaping (Data?, Error?) -> ()) {
        completion(dataToReturn, errorToReturn)
    }
}
