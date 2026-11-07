//
//  BookViewModel.swift
//  ToDoq
//
//  Created by PavunRaj on 03/07/26.
//

import Foundation
import SwiftUI
import Combine
class BookViewModel: ObservableObject {
    @Published var books: [BookModel] = []
   
    
    func fetchData() {
        books = [BookModel(name: "Name1"),BookModel(name: "Name2"),BookModel(name: "Name3"),BookModel(name: "Name4"),BookModel(name: "Name5"),BookModel(name: "Name6"),BookModel(name: "Name7"),BookModel(name: "Name8"),BookModel(name: "Name9"),BookModel(name: "Name10")]
    }
}
