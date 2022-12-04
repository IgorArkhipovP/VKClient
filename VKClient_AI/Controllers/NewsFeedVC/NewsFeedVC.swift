//
//  NewsFeedVC.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.06.2022.
//

import UIKit

class NewsFeedVC: UIViewController {
    
    @IBOutlet weak var newsfeedTableView: UITableView!
    
    var newsFeed: [NewsFeedModel] = [
        NewsFeedModel(headOfNews: "Panda was born in a zoo", textOfNews: "Panda was born in Berlin Zoo. He was name Carl the Great.", imageOfNews: UIImage(named: "pass")!, likeCount: 343, shareCount: 346, commentsCount: 545),
        NewsFeedModel(headOfNews: "New version of Swift is prepared", imageOfNews: UIImage(named: "swift")!, likeCount: 2828, shareCount: 827, commentsCount: 728),
        NewsFeedModel(headOfNews: "New version of Swift is prepared", textOfNews: "Apple presented a new version yeasterday in Moscow. Now you swift looks the same as ordinary language", likeCount: 2828, shareCount: 827, commentsCount: 728),
        NewsFeedModel(headOfNews: "New version of Swift is prepared", likeCount: 2828, shareCount: 827, commentsCount: 728),
        NewsFeedModel(headOfNews: "Panda was born in a zoo", textOfNews: "Panda was born in Berlin Zoo. He was name Carl the Great.", imageOfNews: UIImage(named: "pass")!, likeCount: 343, shareCount: 346, commentsCount: 545),
    ]
    
    // var newsFeedOnlineArray: NewsFeedOnline?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsfeedTableView.dataSource = self
        newsfeedTableView.delegate = self
        cellsRegister()
        // fillOutNewsFeed()
        NetworkServices().newsFeedJSON()
    }
    
//    func fillOutNewsFeed(){
//        NetworkServices.shared.getNewsFeed { [weak self] result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let feeds):
//                DispatchQueue.main.async {
//                    self?.newsFeedOnlineArray = feeds
//                    self?.newsfeedTableView.reloadData()
//                }
//            }
//        }
//    }
    
    private func cellsRegister(){
        newsfeedTableView.register(UINib(nibName: "NewsFeedTVCell", bundle: nil), forCellReuseIdentifier: NewsFeedTVCell.reuseTitleCellID)
        newsfeedTableView.register(UINib(nibName: "PostTVCell", bundle: nil), forCellReuseIdentifier: PostTVCell.reusePostCellID)
        newsfeedTableView.register(UINib(nibName: "ImageTVCell", bundle: nil), forCellReuseIdentifier: ImageTVCell.reuseImageCellID)
        newsfeedTableView.register(UINib(nibName: "DetailsTVCell", bundle: nil), forCellReuseIdentifier: DetailsTVCell.reuseDetailsCellID)
    }
}

extension NewsFeedVC: UITableViewDelegate, UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsFeed.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row
        {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedTVCell.reuseTitleCellID, for: indexPath) as? NewsFeedTVCell else { return UITableViewCell() }
            cell.nameLabel.text = newsFeed[indexPath.section].headOfNews
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVCell.reusePostCellID, for: indexPath) as? PostTVCell
                    // let postFeed = newsFeedOnlineArray?.response.items[indexPath.section]
            else { return UITableViewCell() }
            // cell.configure(feed: postFeed)
            // cell.postLabel.text = newsFeed[indexPath.section].textOfNews
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTVCell.reuseImageCellID, for: indexPath) as? ImageTVCell else { return UITableViewCell() }
            cell.imageNewsFeed.image = newsFeed[indexPath.section].imageOfNews
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTVCell.reuseDetailsCellID, for: indexPath) as? DetailsTVCell else { return UITableViewCell() }
            cell.commentsLabel.text = String(newsFeed[indexPath.section].commentsCount)
            cell.likeLabel.text = String(newsFeed[indexPath.section].likeCount)
            cell.sharesLabel.text = String(newsFeed[indexPath.section].shareCount)
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 40
        case 1:
            if (newsFeed[indexPath.section].textOfNews == nil) || (newsFeed[indexPath.section].textOfNews == "") {
                return 0
            } else {
            return 80
            }
        case 2:
            if newsFeed[indexPath.section].imageOfNews == nil{
               return 0
            } else {
            return 100
            }
        case 3:
            return 40
        default:
            return 10
        }
        
    }
    
    //MARK: Online request
    
    //    func fillOutNewsAdd(){
    //        NetworkServices.shared.getNewsFeed { [weak self] result in
    //            switch result {
    //            case .failure(let error):
    //                print(error)
    //            case .success(let newsFeed):
    //                DispatchQueue.main.async {
    //                    self?.newsFeed = newsFeed
    //                    print(newsFeed)
    //                    self?.newsfeedTableView.reloadData()
    //                }
    //            }
    //        }
    //    }
}
