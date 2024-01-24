//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Pedro Henrique on 22/01/24.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon: Pokemon
    let getBackgroundColor: Color
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.getBackgroundColor = PokemonCellViewModel.getBackgroundColor(forType: pokemon.type)
    }
    
    var body: some View {
        
        NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
            ZStack {
                VStack(alignment: .leading) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 9)
                        .padding(.leading)
                    
                    HStack {
                        Text(pokemon.type)
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.25))
                            )
                            .frame(width: 100, height: 24)
                        
                        KFImage(URL(string: pokemon.imageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding([.bottom, .trailing], 10)
                    }
                }
            }
            .background(getBackgroundColor)
            .cornerRadius(12)
            .shadow(color: getBackgroundColor, radius: 6, x: 0.0, y: 0.0)
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POCKEMON[0])
    }
}
