//
//  HeaderMenuView.swift
//  HotmartTest
//
//  Created by Tiago Braga on 05/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class HeaderMenuView: UIView {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: Public Methods
    func populateHeader(_ image: UIImage, withName name: String, withEmail email: String) {
        self.backgroundImageView.image = image
        self.imageImageView.cicleMask(image)
        self.nameLabel.text = name.uppercased()
        self.emailLabel.text = email
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyBlur()
    }
    
    // MARK: Private Methods
    private func applyBlur() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurEffectView, aboveSubview: self.backgroundImageView)
    }

}
