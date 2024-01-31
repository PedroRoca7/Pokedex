//
//  PokedexView.swift
//  Pokedex
//
//  Created by Pedro Henrique on 22/01/24.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonCellViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 15) {
                    ForEach(searchPokemon) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokemons")
        }
        .searchable(text: $searchText)
        .accentColor(.black)
    }
    
    var searchPokemon: [Pokemon] {
        if searchText.isEmpty {
            return viewModel.pokemonsList
        } else {
            return viewModel.pokemonsList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}




struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
