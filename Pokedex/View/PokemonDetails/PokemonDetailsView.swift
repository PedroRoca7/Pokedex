//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Pedro Henrique on 22/01/24.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsView: View {
    let pokemon: Pokemon
    let getBackgroundColor: Color
    @State var selected = 1
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.getBackgroundColor = PokemonCellViewModel.getBackgroundColor(forType: pokemon.type)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        //background
        NavigationView {
            ZStack {
                getBackgroundColor.ignoresSafeArea()
                Image(systemName: "car")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.trailing, -200)
                    .padding(.bottom, 350)
                    .opacity(0.25)
                Rectangle()
                    .frame(height: 550)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.bottom, -350)
                VStack {
                    HStack {
                        Text("poison")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.25))
                            )
                            .frame(width: 120, height: 24)
                        
                        Spacer()
                        
                        Text("#001")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.25))
                            )
                            .frame(width: 120, height: 24)
                        
                    }
                    Spacer()
                    Picker(selection: $selected, label: Text("Picker"), content: {
                        Text("About").tag(1)
                        Text("Evolutions").tag(2)
                        Text("Base Stats").tag(3)
                        Text("Moves").tag(4)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 350)
                    
                }
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.bottom, 300)
            }
            .navigationTitle("Bulbasaur")
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: MOCK_POCKEMON[0])
    }
}
