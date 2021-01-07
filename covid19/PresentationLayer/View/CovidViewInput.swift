//
//  CovidViewInput.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

protocol CovidViewInput: class {
    
    func setupInitialState()
    
    func presentCovid(models: [CovidModel]?)
}
