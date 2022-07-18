//
//  PhotoOnlineModel.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 21.02.2022.
//

import Foundation

// MARK: - PhotoOnlineModel
struct PhotoOnlineModel: Codable {
    let response: PhotoResponse
}

// MARK: - Response
struct PhotoResponse: Codable {
    let count: Int
    let items: [PhotoItem]
}

// MARK: - Item
struct PhotoItem: Codable {
    let albumID, date, id, ownerID: Int
    let postID: Int
    let sizes: [Size]
    let text: String
    let hasTags: Bool

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case postID = "post_id"
        case sizes, text
        case hasTags = "has_tags"
    }
}

// MARK: - Size
struct Size: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}
