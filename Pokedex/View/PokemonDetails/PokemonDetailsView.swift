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
    @State var selected = 3
    
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
                Image("PokeballBackgroundWhite")
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
                        TypeAndIdView(text: pokemon.type)
                        Spacer()
                        TypeAndIdView(text: "#\(pokemon.id)")
                    }
                    Spacer()
                    PickerView(selected: self.$selected)
                        .padding(.bottom,20)
                    switch selected {
                    case 1:
                        AboutPokemonView(valueHeight: "10", valueWeight: "30")
                    case 2:
                        BaseStatsPokemonView(attackValue: 65, defenseValue: 120)
                    default:
                        EvolutionsPokemonView()
                    }
                    
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
