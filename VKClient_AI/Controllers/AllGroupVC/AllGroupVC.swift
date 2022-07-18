//
//  AllGroupVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.11.2021.
//

import UIKit

class AllGroupVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchAllGroupsBar: UISearchBar!
    
    var filteredAllGroupsArray = [Groups]()
    var allGroupsArray = [Groups]()
    
    let reUseIdentifier = "reUseIdentifier"
    let heightTableViewCell: CGFloat = 80
    
    var searchGroup: GroupOnlineModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchAllGroupsDelegate()
        tableViewFunc()
        fillOutAllGroupsArray()
        filteredAllGroupsArray = allGroupsArray
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
