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


    //MARK: OnlineModel
struct FeedResponseOnlineModel: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
}

struct CountableItem: Decodable {
    let count: Int
}
