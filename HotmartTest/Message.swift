//
//  Message.swift
//  HotmartTest
//
//  Created by Tiago Braga on 08/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

struct Message {
    
    var photo: UIImage? = nil
    var name: String? = nil
    
}

extension Message {
    
    func firstChar() -> Character {
        if self.name != nil {
            return self.name!.characters.first!
        }
        
        return Character("")
    }
    
}

