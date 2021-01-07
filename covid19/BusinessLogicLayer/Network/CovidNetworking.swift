//
//  CovidNetworking.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

protocol CovidNetworkingType {
    
    func getCovidInfo(completion: @escaping ([CovidModel]?) -> Void)
    
}

final class CovidNetworking: CovidNetworkingType {
    
    private let network = Network<CovidRequest>()
    
    func getCovidInfo(completion: @escaping ([CovidModel]?) -> Void) {
        network.request(request: .covid, decodeType: CountriesModel.self) { result in
            switch result {
            case .success(let model):
                completion(model.countries)
            case .failure(_), .empty, .wrongStatusCode:
                completion(nil)
            }
        }
    }
    
}
