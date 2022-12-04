//
//  LoginVC+Animation.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 05.12.2021.
//

import UIKit

extension LoginVC {
    
    func animateMainTitleSubstitution (){
        UIView.transition(
            with: titleLabel,
            duration: 2,
            options: .transitionFlipFromBottom,
            animations: {[weak self] in
                guard let self = self else {return}
                self.titleLabel.text = "Welcome to VK Client"
                self.titleLabel.textAlignment = .center
            })
    }
    
    func animateLogitInput(){
        usernameLabel.transform = CGAffineTransform(translationX: -(self.view.frame.width), y: 0)
        UIView.animate(withDuration: 2) {
            [weak self] in
            guard let self = self else {return}
            self.usernameLabel.transform = .identity
        }
    }
    
    func animatePasswordInput(){
        passwordLabel.transform = CGAffineTransform(translationX: (self.view.frame.width), y: 0)
        UIView.animate(withDuration: 2){
            [weak self] in
            guard let self = self else {return}
            self.passwordLabel.transform = .identity
        }
    }
    
    func animateFields() {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        fadeInAnimation.duration = 1
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
        fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        loginInput.layer.add(fadeInAnimation, forKey: nil)
        passwordInput.layer.add(fadeInAnimation, forKey: nil)
    }
    
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        loginInButton.layer.add(animation, forKey: nil)
    }
    
    func dotsAnimate(exitAfter: Int, currentCount: Int){
        let timeInterval: CGFloat = 0.9
        UIView.animate(withDuration: timeInterval) {[weak self] in
            self?.firstView.alpha = 1
            self?.secondView.alpha = 0
            self?.thirdView.alpha = 0
            self?.fourthView.alpha = 0
            self?.fifthView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: timeInterval) {[weak self] in
                self?.firstView.alpha = 0
                self?.secondView.alpha = 1
                self?.thirdView.alpha = 0
                self?.fourthView.alpha = 0
                self?.fifthView.alpha = 0
            } completion: { _ in
                UIView.animate(withDuration: timeInterval) {[weak self] in
                    self?.firstView.alpha = 0
                    self?.secondView.alpha = 0
                    self?.thirdView.alpha = 1
                    self?.fourthView.alpha = 0
                    self?.fifthView.alpha = 0
                } completion: { _ in
                    UIView.animate(withDuration: timeInterval) {[weak self] in
                        self?.firstView.alpha = 0
                        self?.secondView.alpha = 0
                        self?.thirdView.alpha = 0
                        self?.fourthView.alpha = 1
                        self?.fifthView.alpha = 0
                    } completion: { _ in
                        UIView.animate(withDuration: timeInterval) {[weak self] in
                            self?.firstView.alpha = 0
                            self?.secondView.alpha = 0
                            self?.thirdView.alpha = 0
                            self?.fourthView.alpha = 0
                            self?.fifthView.alpha = 1
                        } completion: {[weak self] _ in
                            if currentCount < exitAfter {
                                self?.dotsAnimate(exitAfter: exitAfter, currentCount: currentCount + 1)
                            }
                            else {
                                self?.firstView.alpha = 1
                                self?.secondView.alpha = 1
                                self?.thirdView.alpha = 1
                                self?.fourthView.alpha = 1
                                self?.fifthView.alpha = 1
                            }
                        }
                    }
                }
            }
        }
    }
}
