//
//  ContentView.swift
//  Task
//
//  Created by PavunRaj on 17/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    @State private var userNames:[String] = ["Name1","Name 2","Name 3"]
    @State private var vm = UserViewModel()
    @StateObject private var randomUserVM = RandomUserVM()
    var body: some View {
        VStack {
           TextField("Enter Value", text: $text)
                .textFieldStyle(.roundedBorder)
                .foregroundStyle(.black)
                .padding()
            Text("The label is: \(text.isEmpty ? "Empty text field" : text)")
            
            Spacer()
            
//            List(userNames, id: \.self) { item in
//                           Text(item)
//                       }
                       
//            List {
//                ForEach(userNames, id: \.self) { names in
//                    Text(names)
//                }
//                .onDelete(perform: deleteOperation(_:))
//            }
//            .ignoresSafeArea()
           
            
//            List(vm.user) { name in
//                Text(name.name)
//            }
            
           // First level API call
            List(randomUserVM.userDetails, id: \.login.uuid) { result in
                Text(result.email.lowercased())
                Text(result.name.first)
                AsyncImage(url: URL(string: result.picture.medium))
                    .clipShape(.circle)
            }
            
            // Second level API call
            
            List(randomUserVM.userDetails, id:  \.name) { result in
                HStack {
                    Text(result.name.first.uppercased())
                    Text(result.name.last.lowercased())
                }
                
            }
//            .task {
//               // randomUserVM.fetchSecoundTimeUserDetails()
//                do {
//                    try await randomUserVM.fetchUsers()
//                } catch {
//                    print("Error")
//                }
//            }
            
            .task {
                do {
                  //  try await randomUserVM.fetchMultipleUserWithTaskGroup()
                }catch {
                    
                }
            }
            
            
            .task {
                randomUserVM.fetchMultipleWithCombine()
            }
            
//            .onAppear {
//                Task {
//                   // randomUserVM.fetchCurrentUserDetails()
//                    randomUserVM.fetchSecoundTimeUserDetails()
//                }
//            }
            Button(action: {
                guard  !text.isEmpty else { return }
//                userNames.append(text)
                   vm.adduser(text: text)
                text = ""
            }, label: {
                Spacer()
                Image(systemName: "plus")
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
                    
                    //Text("Action")
            })
            
        }
 
       
        .padding()
        
        
    }
    
    func deleteOperation(_ index: IndexSet) {
        if let index =  index.first {
            userNames.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}
