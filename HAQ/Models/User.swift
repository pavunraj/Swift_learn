//
//  User.swift
//  HAQ
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation

struct Product: Identifiable, Codable{
    var id = UUID()
    var name: String
    var type: String
    var price: Double
}
