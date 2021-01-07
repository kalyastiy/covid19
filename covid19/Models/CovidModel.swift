//
//  CovidModel.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

struct CountriesModel: Codable {
    let countries: [CovidModel]
    
    enum CodingKeys: String, CodingKey {
        case countries = "Countries"
    }
    
}

struct CovidModel: Codable {
    let country: String
    let newConfirmed: Int
    let totalConfirmed: Int
    let newDeaths: Int
    let totalDeaths: Int
    let newRecovered: Int
    let totalRecovered: Int
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }

}
