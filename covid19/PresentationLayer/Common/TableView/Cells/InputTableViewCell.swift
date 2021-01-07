//
//  InputTableViewCell.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import UIKit

final class InputTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setInfo(model: CovidModel) {
        countryLabel.text = model.country
        confirmedLabel.text = "\(model.totalConfirmed)"
        deathsLabel.text = "\(model.totalDeaths)"
        recoveredLabel.text = "\(model.totalRecovered)"
    }
    
}
