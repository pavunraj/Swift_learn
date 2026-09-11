//
//  UserComments.swift
//  API Request
//
//  Created by PavunRaj on 31/08/26.
//

import Foundation

struct Comments: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias UserComments = [Comments]
