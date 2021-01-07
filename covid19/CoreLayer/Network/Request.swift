//
//  Request.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol Request {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

extension Request {
    
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }

    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        return urlComponents?.url
    }
    
}
