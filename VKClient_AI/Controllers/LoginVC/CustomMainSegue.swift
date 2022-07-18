//
//  CustomMainSegue.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 12.12.2021.
//

import UIKit

//MARK: Example of Custom Segue
//class CustomMainSegue: UIStoryboardSegue {
//
//
//    override func perform() {
//        guard let containerView = source.view.superview,
//              let destinationView = destination.view
//                //              let sourceController = source as? LoginVC
//        else {return}
//
//        let destinationFrame = source.view.frame
//
//        containerView.addSubview(destinationView)
//        destinationView.frame = CGRect.init(x: source.view.frame.width / 2, y: source.view.frame.height / 2, width: 0, height: 0)
//
//        UIView.animate(withDuration: 3) {[weak self] in
//            self?.source.view.frame = destinationView.frame
//        } completion: { _ in
//            UIView.animate(withDuration: 3){
//                destinationView.frame = destinationFrame
//            } completion: {[weak self] isSuccess in
//                if isSuccess,
//                   let self = self {
//                    self.source.present(self.destination, animated: false, completion: nil)
//                }
//            }
//        }
//    }
//}
