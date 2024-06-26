//
//  DogsViewModel.swift
//  cats-dogs
//
//  Created by Joao Rocha on 26/06/24.
//

import Foundation

final class DogsViewModel: ObservableObject {
    @Published var dogs: Dogs?

    func performAPICall() async throws -> Dogs {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random/10")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Dogs.self, from: data)
        return wrapper
    }

    func fetch() {
        Task {
            do {
                dogs = try await performAPICall()
            } catch {
                dogs = nil
            }
        }
    }
}
