//
//  APITwitterDelegate.swift
//  D04
//
//  Created by Arthur DUBEDAT on 3/30/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: class {
    
    func handleTweet(tweet: Tweet)
    func error(e: NSError)
}
