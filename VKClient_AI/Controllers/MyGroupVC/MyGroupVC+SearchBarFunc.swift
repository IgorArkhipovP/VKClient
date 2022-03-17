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
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
            var tempData: GroupOnlineModel = self.myGroups!
            tempData.response.items = []
            
            if searchText.isEmpty {
                self.myGroupFiltered = self.myGroups
            } else {
                tempData.response.items =
                self.myGroups?.response.items.filter { "\($0.name)".localizedCaseInsensitiveContains(searchText) }
                ?? []
                self.myGroupFiltered = tempData
                self.tableView.reloadData()
            }
        })
        
        
        //        filteredMyGroupsArray = []
        //
        //        if searchText.isEmpty {
        //            filteredMyGroupsArray = myGroupsArray
        //        }
        //        for group in myGroupsArray{
        //            if group.name.lowercased().contains(searchText.lowercased()) {
        //                filteredMyGroupsArray.append(group)
        //
        //            }
        //        }
        //        self.tableView.reloadData()
    }
}
