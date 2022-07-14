//
//  NewsFeedVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.06.2022.
//

import UIKit

class NewsFeedVC: UIViewController {
    
    @IBOutlet weak var newsfeedTableView: UITableView!
    
    var newsFeed: FeedResponseOnlineModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // NetworkServices().getNewsFeed()
        newsfeedTableView.dataSource = self
        newsfeedTableView.delegate = self
        newsfeedTableView.register(UINib(nibName: "NewsFeedTVCell", bundle: nil), forCellReuseIdentifier: NewsFeedTVCell.reuseID)
        fillOutNewsAdd()
    }
    
}

extension NewsFeedVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedTVCell.reuseID, for: indexPath) as! NewsFeedTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
    
    func fillOutNewsAdd(){
        NetworkServices.shared.getNewsFeed { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let newsFeed):
                DispatchQueue.main.async {
                    self?.newsFeed = newsFeed
                    print(newsFeed)
                    self?.newsfeedTableView.reloadData()
                }
            }
        }
    }
}
