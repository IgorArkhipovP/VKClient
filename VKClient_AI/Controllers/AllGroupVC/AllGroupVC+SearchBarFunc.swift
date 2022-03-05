//
//  File.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 09.12.2021.
//

import UIKit

extension AllGroupVC: UISearchBarDelegate {
    
    func searchAllGroupsDelegate () {
        searchAllGroupsBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        NetworkServices.shared.loadSearchRequest(request: searchText) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let groups):
                
                self?.searchGroup = groups
                self?.tableView.reloadData()
                
            }
        }
        
//        filteredAllGroupsArray = []
//        // NetworkServices().loadSearchRequest(request: searchText)
//
//        if searchText.isEmpty{
//            filteredAllGroupsArray = allGroupsArray
//        }
//        for group in allGroupsArray {
//            if group.name.lowercased().contains(searchText.lowercased()) {
//                filteredAllGroupsArray.append(group)
//            }
//        }
//
//        self.tableView.reloadData()
    }
}
