//
//  NewsFeedModel.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 27.06.2022.
//

import UIKit

struct NewsFeedModel{
    var headOfNews: String
    var textOfNews: String?
    var imageOfNews: UIImage?
    var likeCount: Int
    var shareCount: Int
    var commentsCount: Int
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsFeedOnline = try? newJSONDecoder().decode(NewsFeedOnline.self, from: jsonData)


