//
//  ContentViewModel.swift
//  Content
//
//  Created by PavunRaj on 31/10/26.
//

import Foundation
import Combine

@MainActor
@Observable

class ContentViewModel {
    var list: ListContent = []
    var errorMessage = ""
    @ObservationIgnored
    private var cancellable = Set<AnyCancellable>()
    func fetchContentList()  {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://dummy-json.mock.beeceptor.com/continents")!)
            .map(\.data)
            .receive(on: DispatchQueue.main)
            .decode(type: ListContent.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] value in
                if case .failure(let failure) = value {
                    self?.errorMessage = failure.localizedDescription
                }
            }, receiveValue: { [weak self] response in
                self?.list = response
            })
            .store(in: &cancellable)
    }
    
}
