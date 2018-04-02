//
//  Tweet.swift
//  D04
//
//  Created by Arthur DUBEDAT on 3/30/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import Foundation

struct Tweet : CustomStringConvertible{
    
    var name : String?
    var text : String?
    
    var description : String {
        return "\(name!) : \(text!)"
    }
    
}
