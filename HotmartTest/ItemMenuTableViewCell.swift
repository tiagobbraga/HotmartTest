//
//  ItemMenuTableViewCell.swift
//  HotmartTest
//
//  Created by Tiago Braga on 06/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class ItemMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameMenuLabel: UILabel!
    @IBOutlet weak var tagView: TagView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tagView.valueLabel.text = ""
    }

}
