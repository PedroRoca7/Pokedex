//
//  EvolutionPokemonCell.swift
//  Pokedex
//
//  Created by Pedro Henrique on 26/01/24.
//

import SwiftUI
import Kingfisher

struct EvolutionPokemonCell: View {
    let evolutionPokemon: Pokemon
    
    init(evolutionPokemon: Pokemon) {
        self.evolutionPokemon = evolutionPokemon
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Image("ArrowDown")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    
                KFImage(URL(string: evolutionPokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .padding()
                    .background(PokemonCellViewModel.getBackgroundColor(forType: evolutionPokemon.type))
                    .cornerRadius(12)
                    .shadow(color: PokemonCellViewModel.getBackgroundColor(forType: evolutionPokemon.type), radius: 6, x: 0.0, y: 0.0)
                    
            }
        }
    }
}

struct EvolutionPokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionPokemonCell(evolutionPokemon: MOCK_POCKEMON[0])
    }
}
