//
//  ContentView.swift
//  CombineWithSwift
//
//  Created by PavunRaj on 24/08/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        
            HeaderView(title: "Combine with Swift", subStitle: "All in one", description: "It's declarative, safe, and easy to use.")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct HeaderView: View {
    var title: String
    var subStitle: String
    var description: String
    
    init(title: String, subStitle: String, description: String) {
        self.title = title
        self.subStitle = subStitle
        self.description = description
    }
    
    var body: some View {
        
        VStack {
            Text(title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
            Text(subStitle)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            
            Divider()
            DescriptionView(disctiption: self.description)
        }
        
    }
}


struct DescriptionView: View {
    
    var disctiption: String
    
    init(disctiption: String) {
        self.disctiption = disctiption
    }
    
    var body: some View {
        
        VStack {
            Text(disctiption)
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}
