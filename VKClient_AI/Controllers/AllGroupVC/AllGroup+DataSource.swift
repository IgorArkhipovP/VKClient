//
//  AllGroup+DataSource.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.11.2021.
//

import UIKit

extension AllGroupVC: UITableViewDataSource {
    
    func tableViewFunc () {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTVCell", bundle: nil), forCellReuseIdentifier: reUseIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchGroup?.response.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reUseIdentifier, for: indexPath) as? CustomTVCell,
              let searchGroup = searchGroup?.response.items[indexPath.row] else {return UITableViewCell()}
        
        //A colour of a click is changed
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemGray5
        cell.selectedBackgroundView = backgroundView
        cell.configure(group: searchGroup)
        
        //Different colour of cells
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .clear
        } else {
            cell.backgroundColor = UIColor(red: 120/255.0, green: 150/255.0, blue: 200/255.0, alpha: 0.3)
        }
        
        return cell
    }
}
