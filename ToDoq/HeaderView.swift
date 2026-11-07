//
//  HeaderView.swift
//  ToDoq
//
//  Created by PavunRaj on 02/07/26.
//

import SwiftUI

struct HeaderView: View {
    @State private var list:[String] = ["Document","Document2", "Document3", "Document4", "Document5", "Document6"]
    var body: some View {
        Text("Hello, World!")
            .fontWidth(.standard)
        VStack {
            List {
                ForEach(list, id: \.self) {
                    Text($0.lowercased())
                }
            }
            DescriptionView(descDetails: "The Description of the value is the application is one of the most popular and widely used programming languages in the world. It is a general-purpose programming language, oriented towards creating user interfaces, and is most well-known for its object-oriented approach, which shares a number of characteristics with both object-building and functional programming languages.")
            Divider()
            Spacer()
        }
    }
}

#Preview {
    HeaderView()
        .preferredColorScheme(.dark)
}


struct DescriptionView: View {
    var descDetails: String
    
    init(descDetails: String) {
        self.descDetails = descDetails
    }
   
    var body: some View {
        Text(descDetails)
            .font(.subheadline)
            .foregroundStyle(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
           
    }
    
    

}


struct Person {
    var userName: String {
        "Pavunraj"
    }
}


