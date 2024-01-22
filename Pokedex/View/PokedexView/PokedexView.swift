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
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 15) {
                    ForEach(viewModel.pokemonsList) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokemons")
        }
    }
}




struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
