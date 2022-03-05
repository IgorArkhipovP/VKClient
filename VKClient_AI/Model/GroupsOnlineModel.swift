//
//  GroupsOnlineModel.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 21.02.2022.
//

import Foundation

// MARK: - GroupOnlineModel
struct GroupOnlineModel: Codable {
    var response: GroupResponse
}

// MARK: - Response
struct GroupResponse: Codable {
    let count: Int
    var items: [GroupItem]
}

// MARK: - Item
struct GroupItem: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: String
    let isAdmin, isMember, isAdvertiser: Int
    let photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}
