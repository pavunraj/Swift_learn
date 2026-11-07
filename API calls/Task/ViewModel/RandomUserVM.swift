//
//  RandomUserVM.swift
//  Task
//
//  Created by PavunRaj on 18/07/26.
//

import Foundation
import Combine


class RandomUserVM: ObservableObject {
    @Published var userDetails: [UserResult] = []
    private var cancellable = Set<AnyCancellable>()
    let urls = [
        "https://randomuser.me/api/",
        "https://randomuser.me/api/",
        "https://randomuser.me/api/",
        "https://randomuser.me/api/"
    ]
    func fetchUserDetails() async throws {
        guard let url = URL(string: "https://randomuser.me/api/") else { return  }
        let JSONDecorder = JSONDecoder()
        let (data, response) = try await URLSession.shared.data(from: url)
        let userData = try JSONDecorder.decode(RandomUserModel.self, from: data)
        userDetails = userData.results
        
    }
    
    func fetchCurrentUserDetails() {
        guard let url = URL(string: "https://randomuser.me/api/") else { return  }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RandomUserModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("Details")
                case .failure(let error):
                    print(error)
                }
                
            }, receiveValue: { response in
                self.userDetails = response.results
                
            })
            .store(in: &cancellable)
    }
    
   
    // another API call
    
    func fetchSecoundTimeUserDetails() {
        guard let url = URL(string: "https://randomuser.me/api/") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RandomUserModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            //.debounce(for: .millis, scheduler: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("Details")
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { response in
                self.userDetails = response.results
            })
            .store(in: &cancellable)
    }
        
    // multiple API call throw async/await
    
    
    func fetchUsers() async throws {
       
        
        for url in urls {
            async let user = fetchUser(url: URL(string: url))
            if let user = try await user {
                self.userDetails.append(contentsOf: user.results)
            }
        }
    }
    
    func fetchUser(url: URL?) async throws -> RandomUserModel? {
        guard let url = url else { return nil  }
        let(data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(RandomUserModel.self, from: data)
    }
    
    // multiple API with TaskGroup
    
    func fetchMultipleUserWithTaskGroup() async throws {
        
        try await withThrowingTaskGroup(of: RandomUserModel.self) { group in
            
            for url in urls {
                group.addTask {
                    let url = URL(string: url)!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    return try JSONDecoder().decode(RandomUserModel.self, from: data)
                }
            }
            
            for try await user in group {
                self.userDetails.append(contentsOf: user.results)
            }
        }
    
    }
    
    
    func fetchMultipleWithCombine() {
    
        
        let publisher = urls.map { url in
            URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
                .map {$0.data }
                .decode(type: RandomUserModel.self, decoder: JSONDecoder())
        }
        
        Publishers.MergeMany(publisher)
            .collect()
            .sink(receiveCompletion: { _ in }, receiveValue: {
                self.userDetails = $0.flatMap(\.results)
                print($0) }
            )
            .store(in: &cancellable)
    }
}
