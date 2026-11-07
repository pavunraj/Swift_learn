//
//  BookListView.swift
//  ToDoq
//
//  Created by PavunRaj on 03/07/26.
//

import SwiftUI

struct BookListView: View {
    @StateObject private var bookList = BookViewModel()
    @State private var score = ManipulateOperation()
    
    @State var winner = ""
    var body: some View {
        VStack {
//            List(bookList.books,id: \.name) {
//                Text($0.name)
//            }
//            List(bookList.books,id: \.name) { name in
//                HStack {
//                    Image(systemName: "book")
//                    Text(name.name)
//                }
//            }
           
            ViewDetails()
            Text(winner)
            Button(action: {
        
              winner =  score.calculateTeamDetail(teamOne: Int.random(in: 1..<50), teamTwo: Int.random(in: 1..<50))
            }, label: {
               Text("Button action")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20.0).fill(Color.blue))
            })
        }
        .onAppear {
            bookList.fetchData()
        }
    }
}

#Preview {
    BookListView()
}


protocol PersonProtocol {
    var firstname: String { get set }
    var lastName: String { get set }
    
    func fullName() -> String
}


struct DeveloperDetails: PersonProtocol {
    var firstname: String
    
    var lastName: String
    
    func fullName() -> String {
        firstname + " " + lastName
    }
    
     
    
}

struct ViewDetails: View {
    @State private var developers = DeveloperDetails(firstname: "Pavun", lastName: "Raj")
    var body: some View {
        Text(developers.fullName())
        let name = getAgeText(value:"Hello")
        let age = getAgeText(value:23)
       Text("age is \(age)")
        
    }
    func getAgeText<T>(value: T) -> String {
         return String("Some value \(value)")
    }
}


protocol GameScrore {
    associatedtype teamScore
    func calculateTeamDetail(teamOne: teamScore, teamTwo: teamScore) -> String
    
}

struct ManipulateOperation: GameScrore {
    typealias teamScore = Int
    
    func calculateTeamDetail(teamOne: Int, teamTwo: Int) -> String {
        if teamOne > teamTwo {
            return "Team one is winner"
        } else if teamOne < teamTwo {
            return "Team two is winner"
        }
        return "Die"
    }
}


protocol Publisher {
    associatedtype Output
    associatedtype FailureError: Error
    
    func receive<S: Subscriber>(subscriber: S) where S.Input == Output, S.Failure == FailureError
}


protocol Subscriber {
    associatedtype Input
    associatedtype Failure: Error
}
