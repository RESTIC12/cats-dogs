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
        GridItem(.adaptive(minimum: 200, maximum: 800)),
        GridItem(.adaptive(minimum: 200, maximum: 800))
    ]
    
    var body: some View {
        
        ScrollView(.vertical) {
            if let dogs = viewModel.dogs {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(dogs.message, id: \.self) { element in
                        AsyncImage(url: URL(string: element)) { result in
                            result
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Cachorros")
        .onAppear() {
            viewModel.fetch()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.fetch()
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                }
                
            }
        }
    }
}

#Preview {
    DogsView()
}
