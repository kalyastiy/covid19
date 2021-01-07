//
//  CovidFacade.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

protocol CovidFacadeType {
    
    func getCovidInfo(completion: @escaping ([CovidModel]?) -> Void)
    
}

final class CovidFacade: CovidFacadeType {
    
    private let covidNetworking: CovidNetworkingType
    
    init(covidNetworking: CovidNetworkingType) {
        self.covidNetworking = covidNetworking
    }
    
    func getCovidInfo(completion: @escaping ([CovidModel]?) -> Void) {
        covidNetworking.getCovidInfo() { model in
            completion(model)
        }
    }
    
}
