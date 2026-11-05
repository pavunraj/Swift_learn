//
//  ContentView.swift
//  Combine Framework
//
//  Created by PavunRaj on 18/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var bookVM = BookViewModel()
    @State private var age = Int()
    
    var body: some View {
        
       
        List(bookVM.bookList) { book in
            HStack(spacing: 22) {
                Image(systemName: "book")
                    .fontWeight(.bold)
                Text(book.name ?? "UnKnown")
                VStack(spacing: 10) {
                    Text(getAge(age: "31"))
                    Text(getAge(age: 22))
                    
                }
                //Text($0.name ?? "UnKnown")
            }
        }
        
        .task {
            do {
                try await bookVM.fetchBookList()
            } catch {
                print(error)
            }
            
        }
    }
    func getAge<T>(age: T) -> String {
        return "Age value is \(age)"
    }
}

#Preview {
    ContentView()
}
