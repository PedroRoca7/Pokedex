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
    let viewModel = PokemonCellViewModel()
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
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                        .padding(.leading, -175)
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
                        AboutPokemonView(valueHeight: pokemon.height, valueWeight: pokemon.weight, descriptionPokemon: pokemon.description)
                    case 2:
                        BaseStatsPokemonView(attackValue: pokemon.attack, defenseValue: pokemon.defense)
                    default:
                        EvolutionsPokemonView(pokemon: pokemon, listPokemons: viewModel.pokemonsList)
                    }
                    
                }
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.bottom, 300)
            }
            .navigationTitle(pokemon.name)
            .navigationBarHidden(true)
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: MOCK_POCKEMON[0])
    }
}
