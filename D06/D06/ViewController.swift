//
//  ViewController.swift
//  D06
//
//  Created by Arthur DUBEDAT on 4/3/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dynamicAnimator : UIDynamicAnimator?
    let gravityBehavior = UIGravityBehavior()
    let collisionBehavior = UICollisionBehavior()
    let elasticityBehavior = UIDynamicItemBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehavior()
        setupViewControllerGesture()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func createShapeView(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: view)
        let newShapeView = UIShapeView(x: location.x, y: location.y)
        setupShapeViewGesture(for: newShapeView)
        view.addSubview(newShapeView)
        gravityBehavior.addItem(newShapeView)
        collisionBehavior.addItem(newShapeView)
        elasticityBehavior.addItem(newShapeView)
    }
    
    @objc func moveShape(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            dynamicAnimator?.removeBehavior(gravityBehavior)
        }
        gesture.view?.center = gesture.location(in: view)
        dynamicAnimator?.updateItem(usingCurrentState: gesture.view!)
        if gesture.state == .ended {
            dynamicAnimator?.addBehavior(gravityBehavior)
        }
    }
    
    @objc func resizeShape(gesture: UIPinchGestureRecognizer) {
        let shapeView = gesture.view as! UIShapeView
        dynamicAnimator?.removeAllBehaviors()
        shapeView.bounds.size.width = gesture.view!.bounds.size.width * gesture.scale
        shapeView.bounds.size.height = gesture.view!.bounds.size.height * gesture.scale
        if shapeView.isCircle! {
            shapeView.layer.cornerRadius = shapeView.bounds.size.width/2
        }
        gesture.scale = 1.0
        dynamicAnimator?.addBehavior(gravityBehavior)
        dynamicAnimator?.addBehavior(collisionBehavior)
        dynamicAnimator?.addBehavior(elasticityBehavior)
    }
    
    @objc func rotateShape(gesture: UIRotationGestureRecognizer) {
        dynamicAnimator?.removeAllBehaviors()
        gesture.view?.transform = gesture.view!.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
        dynamicAnimator?.addBehavior(gravityBehavior)
        dynamicAnimator?.addBehavior(collisionBehavior)
        dynamicAnimator?.addBehavior(elasticityBehavior)
    }
    
    func setupBehavior() {
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        elasticityBehavior.elasticity = 0.5
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        dynamicAnimator?.addBehavior(gravityBehavior)
        dynamicAnimator?.addBehavior(collisionBehavior)
        dynamicAnimator?.addBehavior(elasticityBehavior)
    }
    
    func setupViewControllerGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createShapeView(gesture:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func setupShapeViewGesture(for view: UIShapeView) {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateShape(gesture:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(resizeShape(gesture:)))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(moveShape(gesture:)))
        view.addGestureRecognizer(panGesture)
        view.addGestureRecognizer(pinchGesture)
        view.addGestureRecognizer(rotationGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

