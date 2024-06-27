//
//  DogsView.swift
//  cats-dogs
//
//  Created by Joao Rocha on 26/06/24.
//

import SwiftUI

struct DogsView: View {
    @StateObject var viewModel = DogsViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 100, maximum: 200)),
        GridItem(.adaptive(minimum: 100, maximum: 200))
    ]

    var body: some View {
        ScrollView(.vertical) {
            if let dogs = viewModel.dogs {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(dogs.message, id: \.self) { element in
                        AsyncImage(url: URL(string: element)) { result in
                            result.image?
                                .resizable()
                                .scaledToFit()
                        }
                        .cornerRadius(8)
//                        .frame(width: 200, height: 200)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .onAppear() {
            viewModel.fetch()
        }
    }
}

#Preview {
    DogsView()
}
