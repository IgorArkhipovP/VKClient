//
//  CustomTVCell.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 26.11.2021.
//

import UIKit
import Kingfisher

class CustomTVCell: UITableViewCell {
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var containerView: UIView!
    
    var closure: (() -> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        nameLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(image: UIImage?, text: String?){
        avatarImageView.image = image
        nameLabel.text = text
    }
    
    func configure(friend: FriendItem) {
        avatarImageView.kf.setImage(with: URL(string: friend.photo100))
        avatarImageView.layer.cornerRadius = 28
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.systemRed.cgColor
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        avatarImageView.clipsToBounds = true
        nameLabel.text = friend.firstName + " " + friend.lastName
        //Added Age Label
        ageLabel.text = nil
    }
    
    func configure(group: GroupItem) {

        
        nameLabel.text = group.name
        
        avatarImageView.kf.setImage(with: URL(string: group.photo100))
        avatarImageView.layer.cornerRadius = 28
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.systemRed.cgColor
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        avatarImageView.clipsToBounds = true
        
        //if let imageName = group.avatar {
//            avatarImageView.image = UIImage(named: imageName)
//            avatarImageView.layer.cornerRadius = 28
//            avatarImageView.layer.borderWidth = 3
//            avatarImageView.layer.borderColor = UIColor.systemRed.cgColor
//            containerView.clipsToBounds = false
//            containerView.layer.shadowColor = UIColor.black.cgColor
//            containerView.layer.shadowOpacity = 0.5
//            containerView.layer.shadowOffset = .zero
//            containerView.layer.shadowRadius = 10
//            containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
//            avatarImageView.clipsToBounds = true
//        }
//        nameLabel.text = group.name
        ageLabel.text = nil
    }
    
    @IBAction func pressImageViewButton(_ sender: Any) {
        
        let original = self.avatarImageView.transform
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: [ .autoreverse],
                       animations: { [weak self] in
            guard let self = self else {return}
            self.avatarImageView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        }, completion: { _ in
            self.avatarImageView.transform = original
            self.closure?()
        })
    }
}

//
//      MARK: From big to small (Example of code)
//       UIView.animate(withDuration: 2){ [weak self] in
//           guard let self = self else {return}
//           self.avatarImageView.frame = CGRect(x: 0.005, y: 0.005, width: 1, height: 1)
//       } completion: { isSuccess in
//           if isSuccess {
//               UIView.animate(withDuration: 10,
//                              delay: 0,
//                              usingSpringWithDamping: 0.3,
//                              initialSpringVelocity: 0,
//                              options: [],
//                              animations: {[weak self] in
//                              guard let self = self else {return}
//                              self.avatarImageView.frame = sourceFrame
//               },
//                              completion: nil)
//           }
//       }
