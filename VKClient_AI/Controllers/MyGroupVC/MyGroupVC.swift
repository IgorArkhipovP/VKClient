//
//  MyGroupVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 26.11.2021.
//

import UIKit

class MyGroupVC: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchMyGroupBar: UISearchBar!
    
    var filteredMyGroupsArray = [Groups]()
    var myGroupsArray = [Groups]()
    
    let myGroupReUseIdentifier = "reUseIdentifier"
    let heightTableViewCell: CGFloat = 80
    
    var myGroups: GroupOnlineModel?
    var myGroupFiltered: GroupOnlineModel?
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        tableViewFunc()
        fillOutMyGroupsViaTheInternet()
        searchMyGroupBar.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(addGroup(_ :)), name: NSNotification.Name("allGroupSelectedNotificaion"), object: nil)
        
        //MARK: It is made in order to create search
        myGroupFiltered = myGroups
        filteredMyGroupsArray = myGroupsArray
        //  NetworkServices().loadMyGroups()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc func addGroup (_ notification: Notification) {
        guard let groupObject = notification.object as? Groups else {return}
        
        //MARK: Alert Controler in case of adding groups
        if filteredMyGroupsArray.contains(where: {myGroup in
            myGroup.name == groupObject.name
        }) {
            //if group is already added
            let newGroupAlreadyAddedAlert = UIAlertController(title: "Failure", message: "The group \(groupObject.name) is already added to the list of your groups", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            newGroupAlreadyAddedAlert.addAction(action)
            present(newGroupAlreadyAddedAlert, animated: true, completion: nil)
        } else {
            //if group is not already added
            filteredMyGroupsArray.append(groupObject)
            tableView.reloadData()
            let newGroupAlert = UIAlertController(title: "New Group", message: "You have added new group - \(groupObject.name)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            newGroupAlert.addAction(action)
            present(newGroupAlert, animated: true, completion: nil)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
