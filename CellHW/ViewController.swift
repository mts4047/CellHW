//
//  ViewController.swift
//  CellHW
//
//  Created by Myo Thandar soe on 09/12/2022.
//

import UIKit

struct Section {
    let title: String
    let Option: [Financial]
}

struct Financial {
    let image: UIImage?
    let titleName: String
    let handle: (() -> Void)
    
}



class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var models: [Section] = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModel()
        setupView()
        
    }
    
    func configureModel() {
        models.append(Section(title: "WORLD'S ECONOMY", Option: [
            Financial(image: UIImage(named: "news1"), titleName: "Setproduct Design team Strikes back with new impressive iOS kit", handle: {
                print("did tap")
            }),
            Financial(image: UIImage(named: "news2"), titleName: "New iOS kit from Setproduct makes it possible!", handle: {
                print("did tap")
            })
        ]))
    }
    
 
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FinancialCell", bundle: nil), forCellReuseIdentifier: "FinancialCell")
        tableView.register(UINib(nibName: "FinancialHeaderCell", bundle: nil), forCellReuseIdentifier: "FinancialHeaderCell")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].Option.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = models[section]
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "FinancialHeaderCell") as? FinancialHeaderCell
        headerCell?.nameLabel.text = model.title
        headerCell?.indexLabel.text = "MANAGE"
        return headerCell
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return model.title
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FinancialCell", for: indexPath) as? FinancialCell else { return UITableViewCell() }
        let model = models[indexPath.section].Option[indexPath.row]
        cell.configureCell(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
