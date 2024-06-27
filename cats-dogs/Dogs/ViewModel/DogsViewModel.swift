//
//  DogsViewModel.swift
//  cats-dogs
//
//  Created by Joao Rocha on 26/06/24.
//

import Foundation

final class DogsViewModel: ObservableObject {
    @Published var dogs: Dogs?

    func performAPICall() async throws -> Dogs? {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random/10")!
        let (data, response) = try await URLSession.shared.data(from: url)
        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            let wrapper = try JSONDecoder().decode(Dogs.self, from: data)
            return wrapper
        }
        throw NSError(domain: "error occurred", code: -1)
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
