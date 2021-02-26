//
//  Networking.swift
//  RazeCore
//
//  Created by Nineleaps on 27/02/21.
//

import Foundation

extension RazeCore {
    public class Networking {
        /// This class will handle all network calls
        /// - Warning : Must be created before using any public APIs
        public class Manager {
            public init() { }
            
            private let session = URLSession.shared
            
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void ) {
                let task = session.dataTask(with: url) { data, response, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                
                task.resume()
            }
        }
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
