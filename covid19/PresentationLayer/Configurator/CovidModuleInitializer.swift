//
//  CovidModuleInitializer.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import UIKit

class CovidModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var covidViewController: CovidViewController!

    override func awakeFromNib() {

        let configurator = CovidModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: covidViewController)
    }

}
