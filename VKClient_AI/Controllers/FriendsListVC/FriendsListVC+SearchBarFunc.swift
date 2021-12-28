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
        
        filteredFriendsArray = []
        
        if searchText.isEmpty {
            filteredFriendsArray = friendsArray
        }
        for friend in friendsArray {
            if friend.name.lowercased().contains(searchText.lowercased()) {
                filteredFriendsArray.append(friend)
            }
        }
        self.tableView.reloadData()
    }
}
