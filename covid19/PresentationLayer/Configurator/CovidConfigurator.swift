//
//  CovidConfigurator.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import UIKit

class CovidModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CovidViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CovidViewController) {

        let presenter = CovidPresenter()
        presenter.view = viewController
        
        let covidNetworking = CovidNetworking()
        
        let interactor = CovidInteractor()
        interactor.output = presenter
        interactor.covidFacade = CovidFacade(covidNetworking: covidNetworking)

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
