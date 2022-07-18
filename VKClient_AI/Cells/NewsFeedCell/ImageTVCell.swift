//
//  ImageTVCell.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 14.07.2022.
//

import UIKit

class ImageTVCell: UITableViewCell {
    
    static let reuseImageCellID = "ImageNewsFeedTVCell"

    @IBOutlet weak var imageNewsFeed: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
