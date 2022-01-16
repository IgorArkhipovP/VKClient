//
//  MyGroupVC+SearchBarFunc.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 09.12.2021.
//

import UIKit

extension MyGroupVC: UISearchBarDelegate {
    
    func searchMyGroupDelegate(){
        searchMyGroupBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredMyGroupsArray = []
        
        if searchText.isEmpty {
            filteredMyGroupsArray = myGroupsArray
        }
        for group in myGroupsArray{
            if group.name.lowercased().contains(searchText.lowercased()) {
                filteredMyGroupsArray.append(group)
                
            }
        }
        self.tableView.reloadData()
    }
}
