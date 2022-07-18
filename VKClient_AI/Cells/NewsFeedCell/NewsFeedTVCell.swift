//
//  NewsFeedTVCell.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 28.06.2022.
//

import UIKit

class NewsFeedTVCell: UITableViewCell {
    
    static let reuseTitleCellID = "NewsFeedTVCell"

    @IBOutlet weak var iconeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
