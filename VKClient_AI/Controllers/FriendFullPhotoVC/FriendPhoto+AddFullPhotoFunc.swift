//
//  FriendPhoto+AddFullPhotoFunc.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 28.11.2021.
//

import UIKit

extension FriendPhotoVC {
    
    //MARK: It is necessary to add a full photo to FriendPhotoVC
    func addFullPhoto() {
        if let imageToLoad = selectedFriendImage {
            fullPhotoFriend.image = UIImage(named: imageToLoad)
        }
    }
}
