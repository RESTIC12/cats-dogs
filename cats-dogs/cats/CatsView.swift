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
        GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 6, alignment: nil),
        GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 6, alignment: nil),

    ]

    var body: some View {
        
        
        ScrollView {
            
            LazyVGrid(
                columns: columns,
                spacing: 10,
                pinnedViews: [],
                content: {
                    Section(header: Text("Cats")) {
                        ForEach(viewModel.cats, id: \.self) { cat in
                            
                            AsyncImage(url: URL(string: cat.url)!) { result in
                                                        result.image?
                                                            .resizable()
                                                            .scaledToFit()
                                                    }
                                                    .cornerRadius(8)
                            
                            
                        }
                    }
                }
            )
            
        }
        .onAppear() {
            viewModel.fetch()
        
        }

        }
    }




#Preview {
    CatsView()
}
