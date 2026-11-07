//
//  ArticleModel.swift
//  Pavunraj_task
//
//  Created by PavunRaj on 08/09/26.
//

import Foundation

struct Articles: Codable, Identifiable {
    let id: Int
    let title, createdAt, prompt, shortDescription: String
    let content: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case createdAt = "created_at"
        case prompt
        case shortDescription = "short_description"
        case content
        case imageURL = "image_url"
    }
}
