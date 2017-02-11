//
//  TagView.swift
//  HotmartTest
//
//  Created by Tiago Braga on 11/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class TagView: UIView {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    var valueTag: String = "" {
        didSet {
            self.valueLabel.text = valueTag
            self.hideContent()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.hideContent()
    }
    
    // MARK: Private Methods
    private func hideContent() {
        self.isHidden = valueLabel.text!.isEmpty
    }

}
