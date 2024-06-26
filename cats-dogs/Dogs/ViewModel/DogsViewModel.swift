//
//  DogsViewModel.swift
//  cats-dogs
//
//  Created by Joao Rocha on 26/06/24.
//

import Foundation

final class DogsViewModel: ObservableObject {
    @Published var dogs: Dogs?

    func fetch() {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random/10") else {
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let parsed = try JSONDecoder().decode(Dogs.self, from: data)
                print(parsed)
            } catch {
                print(error)
            }

        }.resume()
    }
}
