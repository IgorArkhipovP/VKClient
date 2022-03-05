//
//  FriendsListVC+SearchBarFunc.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 29.11.2021.
//

import UIKit

extension FriendsListVC: UISearchBarDelegate {
    
    func searchMyFriendsDelegate () {
        searchFriendBar.delegate = self
    }
    
    //MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        var tempData: FriendOnlineModel = self.friendsArray!
        tempData.response.items = []
        
        if searchText.isEmpty {
            self.filteredFriendsArray = self.friendsArray
        } else {
            tempData.response.items = self.friendsArray?.response.items.filter {
                "\($0.firstName) \($0.lastName)".localizedCaseInsensitiveContains(searchText) } ?? []
            self.filteredFriendsArray = tempData
            self.tableView.reloadData()
                
            }
            
//        filteredFriendsArray = []
//
//        if searchText.isEmpty {
//            filteredFriendsArray = friendsArray
//        }
//        for friend in friendsArray {
//            if friend.name.lowercased().contains(searchText.lowercased()) {
//                filteredFriendsArray.append(friend)
//            }
//        }
//        self.tableView.reloadData()
//    }
}
}
