//
//  FriendsList+Delegate.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 26.11.2021.
//

import UIKit

extension FriendsListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightTableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toGallerySegue,
           let friendsPhotoArray = sender as? [String],
           let destination = segue.destination as? GalleryVC {
            destination.photoFriendsArray = friendsPhotoArray
        }
    }
    
    //MARK: Segue without animation
    
// func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       if let friendsPhotoArray = friendsArray[indexPath.item].photoAray {
//            performSegue(withIdentifier: toGallerySegue, sender: friendsPhotoArray)
//       }
//    }
}
