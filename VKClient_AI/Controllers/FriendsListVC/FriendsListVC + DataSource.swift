//
//  FriendsListVC + DataSource.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 26.11.2021.
//

import UIKit

extension FriendsListVC: UITableViewDataSource {
    
    func tableViewFunc(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTVCell", bundle: nil), forCellReuseIdentifier: reUseIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredFriendsArray?.response.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reUseIdentifier, for: indexPath) as? CustomTVCell,
       let friend = filteredFriendsArray?.response.items[indexPath.row] else {return UITableViewCell()}
        
        //MARK: Change of colour of a tap
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemGray5
        cell.selectedBackgroundView = backgroundView
        
        
        cell.configure(friend: friend)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .clear
        } else {
            cell.backgroundColor = UIColor.oddBackgroudColor
        }
        
//        cell.configure(friend: filteredFriendsArray[indexPath.row], closure: { [weak self] in
//            if let self = self,
//               let friendsPhotoArray = self.friendsArray[indexPath.item].photoAray {
//                self.performSegue(withIdentifier: self.toGallerySegue, sender: friendsPhotoArray)
//            }
//        })
        return cell
    }
    
}
