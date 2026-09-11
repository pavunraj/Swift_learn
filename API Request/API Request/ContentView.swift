//
//  ContentView.swift
//  API Request
//
//  Created by PavunRaj on 31/08/26.
//

import SwiftUI

struct ContentView: View {
    @State private var userComment = UserCommentVM()
    var body: some View {
        VStack {
            List(userComment.userComment ?? [], id: \.id) { item in
                GroupBox {
                    Text(item.name)
                    Text(item.email)
                }
            }
        }
        .padding()
        .task {
            do {
                try await userComment.fetchUserComment()
            }catch {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
