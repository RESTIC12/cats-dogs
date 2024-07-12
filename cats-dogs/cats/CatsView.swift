//
//  ContentView.swift
//  cats-dogs
//
//  Created by Joao Rocha on 25/06/24.
//

import SwiftUI


struct CatsView: View {
    
    @StateObject var viewModel = CatViewModel()
    
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 200, maximum: 800), alignment: nil),
        GridItem(.adaptive(minimum: 200, maximum: 800), alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: 10,
                pinnedViews: [],
                content: {
                    ForEach(viewModel.cats, id: \.self) { cat in
                        AsyncImage(url: URL(string: cat.url)!) { result in
                            result
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                        .cornerRadius(8)
                    }
                }
            )
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            
        }
        .onAppear() {
            viewModel.fetch()
        } .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.fetch()
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                }
                
            }
        }
        .navigationTitle("Gatos")
    }
}


#Preview {
    CatsView()
}
