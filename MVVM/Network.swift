//
//  Network.swift
//  MVVM
//
//  Created by karnett on 5/6/21.
//

import Foundation

protocol Network {
    func request(url: String, completion: @escaping ([Todo]?, Error?) -> ())
}

enum CustomError: Error {
    case BadURL
}

class MyNetwork: Network {
    func request(url: String, completion: @escaping ([Todo]?, Error?) -> ()) {
        guard let url = URL(string: url) else { completion(nil, CustomError.BadURL); return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            var value: [Todo]?
            if let data = data {
                value = try? JSONDecoder().decode([Todo].self, from: data)
            }
            completion(value, error)
        }.resume()
    }
}
