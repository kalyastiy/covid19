//
//  CovidHeader.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import UIKit

final class CovidHeader: UITableViewHeaderFooterView {
    
    private lazy var countryLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Страна"
        return label
    }()
    
    private lazy var confirmedLabelTitlt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Заразилось"
        label.font = label.font.withSize(13)
        return label
    }()

    private lazy var deathsLabelTitlt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Смертей"
        label.font = label.font.withSize(13)
        return label
    }()

    private lazy var recoveredLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выздоровело"
        label.font = label.font.withSize(13)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContents() {
        
        confirmedLabelTitlt.translatesAutoresizingMaskIntoConstraints = false
        deathsLabelTitlt.translatesAutoresizingMaskIntoConstraints = false
        recoveredLabelTitle.translatesAutoresizingMaskIntoConstraints = false


        contentView.addSubview(countryLabelTitle)
        contentView.addSubview(confirmedLabelTitlt)
        contentView.addSubview(deathsLabelTitlt)
        contentView.addSubview(recoveredLabelTitle)

        NSLayoutConstraint.activate([
            
            countryLabelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            countryLabelTitle.widthAnchor.constraint(equalToConstant: 120),
            countryLabelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            countryLabelTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

            confirmedLabelTitlt.leadingAnchor.constraint(equalTo: countryLabelTitle.trailingAnchor, constant: 0),
            confirmedLabelTitlt.widthAnchor.constraint(equalToConstant: 80),
            confirmedLabelTitlt.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            confirmedLabelTitlt.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            deathsLabelTitlt.leadingAnchor.constraint(equalTo: confirmedLabelTitlt.trailingAnchor, constant: 10),
            deathsLabelTitlt.widthAnchor.constraint(equalToConstant: 60),
            deathsLabelTitlt.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            deathsLabelTitlt.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            recoveredLabelTitle.leadingAnchor.constraint(equalTo: deathsLabelTitlt.trailingAnchor, constant: 10),
            recoveredLabelTitle.widthAnchor.constraint(equalToConstant: 85),
            recoveredLabelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            recoveredLabelTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),


        ])
    }
}
