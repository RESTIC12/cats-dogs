//
//  HomeView.swift
//  cats-dogs
//
//  Created by Larissa Martins Correa on 03/07/24.
//

import SwiftUI

struct HomeView: View {
    
    let widthValue = (UIScreen.main.bounds.width * 0.5) + 10

    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "cat.fill")
                        Image(systemName: "dog.fill")
                            .scaleEffect(x: -1, y: 1)
                    }
                    .padding(.bottom, 10)
                    Text("Selecione quais animais fofinhos você deseja visualizar")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    
                    NavigationLink(destination: CatsView()) {
                        Text("Ver gatos")
                            .frame(width: widthValue, height: 30)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 5)
                    
                    NavigationLink(destination: DogsView()) {
                        Text("Ver cachorrinhos")
                            .frame(width: widthValue, height: 30)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(8)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
