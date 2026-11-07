//
//  ArticleViewModel.swift
//  Pavunraj_task
//
//  Created by PavunRaj on 08/09/26.
//

import Foundation
import  Combine


@MainActor
@Observable
class ArticleViewModel {
    var article = [Articles]()
    
    func fetchArticules() async throws  {
        guard let url = URL(string: Constant.url) else { return }
        let (data, _) = try await URLSession.shared.data(from: url)
        article = try JSONDecoder().decode([Articles].self, from: data)
        print("Fetched \(article.count) articles")
    }
}
