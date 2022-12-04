//
//  StarView.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 10.12.2021.
//

import UIKit

class StarView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let cgContext = UIGraphicsGetCurrentContext() else {return}
        
        cgContext.setStrokeColor(UIColor.systemGreen.cgColor)
        
        cgContext.interpolationQuality = .high
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 40, y: 20))
        path.addLine(to: CGPoint(x: 45, y: 40))
        path.addLine(to: CGPoint(x: 65, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 60, y: 70))
        path.addLine(to: CGPoint(x: 40, y: 55))
        path.addLine(to: CGPoint(x: 20, y: 70))
        path.addLine(to: CGPoint(x: 30, y: 50))
        path.addLine(to: CGPoint(x: 15, y: 40))
        path.addLine(to: CGPoint(x: 35, y: 40))
        path.close()
        
        cgContext.addPath(path.cgPath)
        cgContext.strokePath()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
        shapeLayer.fillColor = .none
        shapeLayer.lineWidth = 3
        shapeLayer.path = path.cgPath
        
        let startAnimation = CABasicAnimation(keyPath: "strokeStart")
        startAnimation.fromValue = 0
        startAnimation.toValue = 0.8
        
        let endAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endAnimation.fromValue = 0.2
        endAnimation.toValue = 1.0
        
        let animation = CAAnimationGroup()
        animation.animations = [startAnimation, endAnimation]
        animation.speed = 0.1
        animation.repeatCount = Float.infinity
        shapeLayer.add(animation, forKey: nil)
        
        self.layer.addSublayer(shapeLayer)
    }
}

