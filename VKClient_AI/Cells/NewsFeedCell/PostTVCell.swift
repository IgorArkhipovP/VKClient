//
//  PostTVCeel.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 14.07.2022.
//

import UIKit

class PostTVCell: UITableViewCell {
    
    static let reusePostCellID = "PostNewsFeedTVCell"
    
    @IBOutlet weak var postLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func configure(feed: ResponseItem) {
//        postLabel.text = feed.text
//    }
}
