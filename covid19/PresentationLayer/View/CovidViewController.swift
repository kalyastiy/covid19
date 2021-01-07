//
//  CovidViewController.swift
//  covid19
//
//  Created by Nikolay Lukyanchikov on 06.01.2021.
//

import UIKit

final class CovidViewController: UIViewController, CovidViewInput {

    var output: CovidViewOutput!
    
    private var covidModels: [CovidModel] = [CovidModel]()

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: CovidViewInput
    func setupInitialState() {
                
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60.0
        tableView.tableFooterView = UIView()
        tableView.register(InputTableViewCell.self)
        tableView.register(CovidHeader.self,
            forHeaderFooterViewReuseIdentifier: "sectionHeader")
    
        view.activityStartAnimating()
    }

    func presentCovid(models: [CovidModel]?) {
        view.activityStopAnimating()
        guard let models = models else {
            showMessage()
            return
        }
        self.covidModels = models
        tableView.reloadData()
    }
    
    private func showMessage() {
        let alert = UIAlertController(title: "Перевод", message: "Не удалось получить перевод", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension CovidViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covidModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCell(indexPath: indexPath)
    }
    
    private func configureCell(indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(InputTableViewCell.self, for: indexPath)
        cell.setInfo(model: covidModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader")
    }
    
}
