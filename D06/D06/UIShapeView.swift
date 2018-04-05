//
//  UIShapeView.swift
//  D06
//
//  Created by Arthur DUBEDAT on 4/3/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import Foundation
import UIKit

class UIShapeView : UIView {
    
    let width = CGFloat(100)
    let height = CGFloat(100)
    let isCircle : Bool?
    
    private func setupForm() {
        if isCircle! {
            self.layer.cornerRadius = self.frame.size.width/2
        }
    }
    
    private func setupColor() {
        switch Int(arc4random_uniform(6)) {
        case 0:
            self.backgroundColor = UIColor.blue
        case 1:
            self.backgroundColor = UIColor.red
        case 2:
            self.backgroundColor = UIColor.green
        case 3:
            self.backgroundColor = UIColor.brown
        case 4:
            self.backgroundColor = UIColor.purple
        default:
            self.backgroundColor = UIColor.orange
        }
    }
    
    init(x: CGFloat, y: CGFloat) {
        isCircle = Int(arc4random_uniform(2)) == 0
        let rect = CGRect(x: x - (width / 2.0), y: y - (height / 2.0), width: width, height: height)
        super.init(frame: rect)
        setupForm()
        setupColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        if isCircle! {
            return .ellipse
        }
        return .rectangle
    }
    
}
