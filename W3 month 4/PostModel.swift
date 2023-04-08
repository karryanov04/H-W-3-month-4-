//
//  PostModel.swift
//  W3 month 4
//
//  Created by Рауль on 8/4/23.
//


import Foundation

struct PostRequst: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Post = [PostRequst]
