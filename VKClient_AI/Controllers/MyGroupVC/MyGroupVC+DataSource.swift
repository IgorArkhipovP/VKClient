//
//  MyGroupVC+DataSource.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 26.11.2021.
//

import UIKit

extension MyGroupVC: UITableViewDataSource{
    
    func tableViewFunc () {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTVCell", bundle: nil), forCellReuseIdentifier: myGroupReUseIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myGroupFiltered?.response.items.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myGroupReUseIdentifier, for: indexPath) as? CustomTVCell,
              let group = myGroupFiltered?.response.items[indexPath.row] else {return UITableViewCell()}
        
        //MARK: Change of colour of a tap
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemGray5
        cell.selectedBackgroundView = backgroundView
        cell.configure(group: group)
        
        //MARK: Different colour of cells
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .clear
        } else {
            cell.backgroundColor = UIColor(red: 120/255.0, green: 150/255.0, blue: 200/255.0, alpha: 0.3)
        }
        return cell
    }
}
