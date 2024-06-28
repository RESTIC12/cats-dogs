//
//  CatsViewModel.swift
//  cats-dogs
//
//  Created by Larissa Martins Correa on 27/06/24.
//

import Foundation

struct Cat: Hashable, Codable {
    let url: String

}

class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    
    func fetch() {
        guard let url = URL(string:
                                "https://api.thecatapi.com/v1/images/search?limit=10") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _,
            error in
            guard let data = data, error == nil else {
                return
            }
            // Convert to JSON
            do {
                let cats = try
                JSONDecoder().decode([Cat].self,
                                     from: data)
                DispatchQueue.main.async {
                    self?.cats = cats
                }
                print(cats)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}

