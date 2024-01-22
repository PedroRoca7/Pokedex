//
//  InitialView.swift
//  Pokedex
//
//  Created by Pedro Henrique on 22/01/24.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Pokedex")
                    .font(.system(size: 80))
                    .bold()
                
                Spacer()
                
                Button("Play") {

                }
                .font(.headline).bold()
                .foregroundColor(Color.white)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.25))
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
