//
//  DetailsTVCell.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 14.07.2022.
//

import UIKit

class DetailsTVCell: UITableViewCell {
    
    static let reuseDetailsCellID = "DetailsPostNewsFeedTVCell"
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
