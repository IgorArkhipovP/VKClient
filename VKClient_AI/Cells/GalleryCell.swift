//
//  GalleryCell.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 28.11.2021.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeCountLabel: UILabel!
    
    var likeButtonState: Bool = false
    var countLike: Int = 0
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(image: UIImage?, index: Int) {
        
        imageView.image = image
        imageView.layer.cornerRadius = 20
        
        
        
        //MARK: Different colors of items
        if index % 2 == 0 {
            backView.backgroundColor = .systemGreen
        } else {
            backView.backgroundColor = .systemTeal
        }
    }
    
    //MARK: Touch of a like button
    @IBAction func likeButtonPressed(_ sender: Any) {
        
        if likeButtonState {
            countLike -= 1
            likeCountLabel.text = String(countLike)
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: { [weak self] in
                guard let self = self else {return}
                self.likeCountLabel.frame.origin.x = 100
            }, completion: {_ in })
        } else {
            countLike += 1
            likeCountLabel.text = String(countLike)
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            let animateLikeButton = CASpringAnimation(keyPath: "position.x")
            //  Example of code how to postpone time of animation
            //  animate.beginTime = CACurrentMediaTime() + 2
            animateLikeButton.fromValue = 0
            animateLikeButton.toValue = 130
            animateLikeButton.duration = 5
            animateLikeButton.stiffness = 200
            animateLikeButton.mass = 1
            animateLikeButton.fillMode = .forwards
            animateLikeButton.isRemovedOnCompletion = false
            likeButton.layer.add(animateLikeButton, forKey: nil)
            let animateLikeCountLabel = CABasicAnimation(keyPath: "position.x")
            animateLikeCountLabel.fromValue = 300
            likeCountLabel.layer.add(animateLikeCountLabel, forKey: nil)
            
        }
        likeButtonState = !likeButtonState
    }
}
