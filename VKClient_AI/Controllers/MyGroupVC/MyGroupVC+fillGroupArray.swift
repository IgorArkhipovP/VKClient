//
//  MyGroupVC+fillGroupArray.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.11.2021.
//

import UIKit

extension MyGroupVC {
    
    //MARK: It is a func to add friends without the Internet
//    func fillOutMyGroupsArray() {
//        let group1 = Groups(name: "Spider-Man Fans", avatar: "spider-man")
//        let group2 = Groups(name: "Last of us Fans", avatar: "last of us")
//        myGroupsArray += [group1, group2]
//    }
    
    func fillOutMyGroupsViaTheInternet(){
        NetworkServices.shared.loadMyGroups { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let groups):
                DispatchQueue.main.async {
                    self?.myGroups = groups
                    self?.myGroupFiltered = groups
                    self?.tableView.reloadData()
                }
            }
        }
    }
}
