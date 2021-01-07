//
//  URLResponse.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

extension URLResponse {

    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
    
}
