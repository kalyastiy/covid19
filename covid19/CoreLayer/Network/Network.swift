//
//  Network.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
    case empty
    case wrongStatusCode
}

final class Network<T: Request> {
    
    private var urlSession = URLSession.shared
    
    init() {}
    
    func request<U>(request: T, decodeType: U.Type, completion: @escaping (Result<U>) -> Void) where U: Decodable {
        
        let dataTask = urlSession.dataTask(with: request.urlRequest) { (data, response, error) in
                        
            let queue = DispatchQueue.main
            
            if let error = error {
                queue.async {
                    completion(.failure(error))
                }
            }
            
            guard let statusCode = response?.getStatusCode(), 200...299 ~= statusCode else {
                queue.async {
                    completion(.wrongStatusCode)
                }
                return
            }
            
            guard let data = data else {
                queue.async {
                    completion(.empty)
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let resp = try decoder.decode(decodeType, from: data)
                queue.async {
                    completion(.success(resp))
                }
            }
            catch let parseError {
                queue.async {
                    completion(.failure(parseError))
                }
            }
        }
        dataTask.resume()
    }
}
