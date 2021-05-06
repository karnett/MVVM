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
        let mockNetwork = MockNetwork(data: data, error: nil)

        let viewModel = ViewModel(delegate: nil, network: mockNetwork)
        XCTAssertEqual(viewModel.getNumberOfRows(), 1)
    }
}



class MockNetwork: Network {
    let dataToReturn: [Todo]?
    let errorToReturn: Error?

    init(data: [Todo]? = nil, error: Error? = nil) {
        self.dataToReturn = data
        self.errorToReturn = error
    }

    func request(url: String, completion: @escaping ([Todo]?, Error?) -> ()) {
        completion(dataToReturn, errorToReturn)
    }
}
