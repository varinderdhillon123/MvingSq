//
//  ViewController.swift
//  MvingSq
//
//  Created by MacStudent on 2020-01-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func aiButton(_ sender: Any) {

        let viewToAnimate = UIView(frame: CGRect(x: 75, y: 75, width: 75, height: 75))
        viewToAnimate.backgroundColor = UIColor.orange
        
        view.addSubview(viewToAnimate)
        
        
        let startPoint = CGPoint(x: 75, y: 75)
        let endPoint = CGPoint(x: 75, y: 175)
        let duration: Double = 4.0
        
        let positionAnimation = constructPositionAnimation(startingPoint: startPoint, endPoint: endPoint, animationDuration: duration)
        
//        viewToAnimate.layer.add(positionAnimation, forKey: "positon")
//        viewToAnimate.layer.position = endPoint
        
        let scaleAnimation = constructScaleAnimation(startingScale: 1.0, endingScale: 0.2, animationDuration: 2.5   )
        viewToAnimate.layer.add(scaleAnimation, forKey: "scale")
    }
    
    
    private func constructScaleAnimation(startingScale: CGFloat, endingScale: CGFloat, animationDuration: Double)-> CABasicAnimation
    {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = startingScale
        scaleAnimation.toValue = endingScale
        scaleAnimation.duration = animationDuration
        scaleAnimation.autoreverses = true
         return scaleAnimation
        }
    
    
private func constructPositionAnimation(startingPoint: CGPoint, endPoint: CGPoint, animationDuration: Double)->CABasicAnimation
    {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = NSValue(cgPoint: startingPoint)
        positionAnimation.toValue = NSValue(cgPoint: endPoint)
        positionAnimation.duration = animationDuration
        positionAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        return positionAnimation
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

