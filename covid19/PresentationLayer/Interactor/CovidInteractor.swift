//
//  CovidInteractor.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

class CovidInteractor: CovidInteractorInput {

    weak var output: CovidInteractorOutput!
    
    var covidFacade: CovidFacadeType!
    
    func getCovidInfo() {
        covidFacade.getCovidInfo() { [weak self] model in
            self?.output.presentCovid(models: model)
        }
    }
    
}
