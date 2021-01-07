//
//  CovidRequest.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

enum CovidRequest {
    case covid
}

extension CovidRequest: Request {
        
    var baseURL: String {
        return "https://api.covid19api.com"
    }

    var path: String {
        switch self {
        case .covid:
            return "/summary"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
