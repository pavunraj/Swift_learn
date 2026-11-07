//
//  UserViewMode.swift
//  Task
//
//  Created by PavunRaj on 18/07/26.
//

import Foundation
@Observable
@MainActor
class UserViewModel {
    var user: [UserName] = []
    
    func adduser(text: String) {
        user.append(UserName(name: text, isSelected: true))
    }
}
