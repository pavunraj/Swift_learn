//
//  BookViewModels.swift
//  Combine Framework
//
//  Created by PavunRaj on 18/09/26.
//

import Foundation
import Combine

@Observable
@MainActor
class BookViewModel {
    var bookList: [BookResponseModel] = []
    
    
    func fetchBookList() async  throws{
        bookList = [BookResponseModel(name: "Book 1"), BookResponseModel(name: "Book 2"), BookResponseModel(name: "Book 3"), BookResponseModel(name: "Book 4"), BookResponseModel(name: "Book 5"), BookResponseModel(name: "Book 6"), BookResponseModel(name: "Book 7"), BookResponseModel(name: "Book 8"), BookResponseModel(name: "Book 9"), BookResponseModel(name: "Book 10"), BookResponseModel(name: "Book 11")]
    }
}
