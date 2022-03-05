//
//  FriendsOnlineModel.swift
//  VKClient_AI
//
//  Created by Игорь  Архипов on 21.02.2022.
//

import Foundation

// MARK: - FriendOnlineModel
struct FriendOnlineModel: Codable {
    var response: FriendResponse
}

// MARK: - Response
struct FriendResponse: Codable {
    let count: Int
    var items: [FriendItem]
}

// MARK: - Item
struct FriendItem: Codable {
    let id: Int
    let firstName, lastName: String
    let canAccessClosed, isClosed: Bool?
    let city: City?
    let trackCode: String
    let deactivated: String?
    let lists: [Int]?
    let photo100: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case city
        case trackCode = "track_code"
        case deactivated, lists
        case photo100 = "photo_100"
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let title: String
}
