//
//  CovidInteractorOutput.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import Foundation

protocol CovidInteractorOutput: class {
    
    func presentCovid(models: [CovidModel]?)
    
}
