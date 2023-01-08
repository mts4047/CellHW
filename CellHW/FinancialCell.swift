//
//  FinancialCell.swift
//  CellHW
//
//  Created by Myo Thandar soe on 09/12/2022.
//

import UIKit

class FinancialCell: UITableViewCell {

    
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var newsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with model: Financial) {
        self.newsLabel.text = model.titleName
        self.imageNews.image = model.image
        self.newsLabel.numberOfLines = 0

    }


    
}
