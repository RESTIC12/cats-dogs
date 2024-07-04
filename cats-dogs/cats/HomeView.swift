//
//  HomeView.swift
//  cats-dogs
//
//  Created by Larissa Martins Correa on 03/07/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CatsView()) {
                    Text("Ver gatos")
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .padding()
                        .cornerRadius(10)
                        
                        
                }
                .padding()
                
                NavigationLink(destination: DogsView()) {
                    Text("Ver cachorrinhos")
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .padding()
                        .cornerRadius(10)
                    
                }
                .padding()
            }
            .navigationTitle("Main screen")
        }
    }
}

#Preview {
    HomeView()
}
