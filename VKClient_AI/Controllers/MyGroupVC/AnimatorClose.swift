//
//  AnimatorClose.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 12.12.2021.
//

import UIKit

class AnimatorPop: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    // This method can only be a no-op if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else {return}
        
        let containerFrame = transitionContext.containerView.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: containerFrame.width / 2, y: containerFrame.height / 2, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            source.view.transform = CGAffineTransform(translationX: -250, y: 250)
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                source.view.transform = CGAffineTransform(translationX: 0, y: 0)
            } completion: { _ in
                UIView.animate(withDuration: 0.0000001) {
                    source.view.transform = CGAffineTransform.identity
                } completion: { isSuccess in
                    transitionContext.completeTransition(isSuccess)
                }
                }
            }
        }
}
