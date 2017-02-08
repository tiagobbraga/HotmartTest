//
//  MessageCollectionViewCell.swift
//  HotmartTest
//
//  Created by Tiago Braga on 08/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Public Methods
    func populateMessage(_ message: Message) {
        if message.photo != nil {
            self.photoImageView.cicleMask(message.photo!)
        } else {
            // color bg
            // first char
        }
        
        self.nameLabel.text = message.name
    }

}
