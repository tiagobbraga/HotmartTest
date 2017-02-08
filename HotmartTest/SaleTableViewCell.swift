//
//  SaleTableViewCell.swift
//  HotmartTest
//
//  Created by Tiago Braga on 08/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class SaleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var warningImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.warningImageView.isHidden = true
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Public Methods
    func populateSale(_ sale: Sale, withWarning warning: Bool = false) {
        self.descriptionLabel!.text = sale.description!
        self.idLabel!.text = sale.id!
        self.dateLabel!.text = sale.date!
        self.priceLabel!.text = sale.price!
        self.warningImageView.isHidden = !warning
    }

}
