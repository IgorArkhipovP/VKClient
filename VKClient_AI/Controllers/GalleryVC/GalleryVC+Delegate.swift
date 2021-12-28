//
//  GalleryVC+Delegate.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 28.11.2021.
//

import UIKit

extension GalleryVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FriendPhotoVC") as? FriendPhotoVC {
            vc.selectedFriendImage = photoFriendsArray[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension GalleryVC: UICollectionViewDelegateFlowLayout {

   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

       return CGSize(width: 360, height: 380)
   }
}


