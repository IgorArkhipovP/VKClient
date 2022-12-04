//
//  FriendPhotoVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 28.11.2021.
//

import UIKit

class FriendPhotoVC: UIViewController {
    
    @IBOutlet var fullPhotoFriend: UIImageView!
    
    var selectedFriendImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        addFullPhoto()
    }
}
