//
//  MyGroupVC+CustomNavigationController.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 12.12.2021.
//

import UIKit

extension MyGroupVC: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        if operation == .push {
        return AnimatorPush()
        }
        return AnimatorPop()
    }
}

