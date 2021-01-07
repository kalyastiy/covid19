//
//  CovidPresenter.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

class CovidPresenter: CovidModuleInput, CovidViewOutput, CovidInteractorOutput {

    weak var view: CovidViewInput!
    var interactor: CovidInteractorInput!

    func viewIsReady() {
        view.setupInitialState()
        getCovidInfo()
    }
    
    func getCovidInfo() {
        interactor.getCovidInfo()
    }

    func presentCovid(models: [CovidModel]?) {
        view.presentCovid(models: models)
    }
}
