//
//  Array.swift
//  CarroAluguel
//
//  Created by Tiago Braga on 09/11/16.
//  Copyright © 2016 Tiago Braga. All rights reserved.
//

import UIKit

extension Array {
    mutating func removeObject<U: Equatable>(_ object: U) -> Bool {
        for (idx, objectToCompare) in self.enumerated() {  // in old swift use enumerate(self)
            if let to = objectToCompare as? U {
                if object == to {
                    self.remove(at: idx)
                    return true
                }
            }
        }
        return false
    }
    
    
}

extension Array where Element: Hashable {
    var setValue: Set<Element> {
        return Set<Element>(self)
    }
}

