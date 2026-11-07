//
//  UserName.swift
//  Task
//
//  Created by PavunRaj on 18/07/26.
//

import Foundation

struct UserName: Identifiable {
    var id = UUID()
    var name: String
    var isSelected: Bool
}
