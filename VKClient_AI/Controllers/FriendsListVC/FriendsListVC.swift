//
//  FriendsListVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 26.11.2021.
//

import UIKit

class FriendsListVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFriendBar: UISearchBar!
    
    var friendsArray: FriendOnlineModel?
    var filteredFriendsArray: FriendOnlineModel?
    let reUseIdentifier = "reUseIdentifier"
    let heightTableViewCell: CGFloat = 80
    let yearsOld = "years old"
    let toGallerySegue = "toGallerySegue"
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchMyFriendsDelegate()
        tableViewFunc()
        fillOutFriendArrayViaTheFriends()
        filteredFriendsArray = friendsArray
        // NetworkServices().loadListOfFriends()
    }
    
 
}



