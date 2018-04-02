//
//  APIController.swift
//  D04
//
//  Created by Arthur DUBEDAT on 3/30/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import Foundation

class APIController {
    
    weak var delegate : APITwitterDelegate?
    
    let token : String
    
    init(delegate: APITwitterDelegate?, token: String) {
        self.delegate = delegate
        self.token = token
    }
    
    
}
