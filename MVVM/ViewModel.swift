//
//  ViewModel.swift
//  MVVM
//
//  Created by karnett on 4/24/21.
//

import Foundation
protocol TodoDelegate {
    func refresh()
}

class ViewModel {
    private var todoList: [Todo]?
    private var error: Error?

    private let delegate: TodoDelegate?
    private let network: Network?

    init(delegate: TodoDelegate?, network: Network = MyNetwork()) {
        self.delegate = delegate
        self.network = network
        fetchData()
    }

    func getNumberOfRows() -> Int {
        return todoList?.count ?? 0
    }

    func getData(row: Int) -> Todo? {
        return todoList?[row]
    }

    private func fetchData() {
        network?.request(url: "https://jsonplaceholder.typicode.com/todos", completion: { (data, error) in
            self.todoList = data
            self.error = error
            self.delegate?.refresh()
        })
    }
}
