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
    @IBOutlet weak var firstCharNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firstCharNameLabel.isHidden = true
    }
    
    // Public Methods
    func populateMessage(_ message: Message) {
        self.photoImageView.image = UIImage()
        self.photoImageView.cicleMask(message.photo, withBackgroundColor: Style.randomColor())
        self.nameLabel.text = message.name
        self.firstCharNameLabel.text = String(message.firstChar())
        self.firstCharNameLabel.isHidden = !(message.photo == nil)
    }

}
