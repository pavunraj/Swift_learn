//
//  UserCommentVM.swift
//  API Request
//
//  Created by PavunRaj on 01/09/26.
//

import Foundation
import Combine


@Observable

class UserCommentVM {
    var userComment: UserComments?
    
    func fetchUserComment() async throws {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return  }
        let (data, _) = try await URLSession.shared.data(from: url)
        userComment = try JSONDecoder().decode(UserComments.self, from: data)
    }
}
