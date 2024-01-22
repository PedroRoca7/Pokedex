//
//  PokemonCellViewModel.swift
//  Pokedex
//
//  Created by Pedro Henrique on 22/01/24.
//

import Foundation
import SwiftUI


class PokemonCellViewModel: ObservableObject {
    @Published var pokemonsList = [Pokemon]()
    @Published var error = String()
    let api = ApiPokemons()
    
    init() {
        loadPokemons()
    }
    
    private func loadPokemons() {
        api.fetchPokemons { pokemons, error in
            if let error = error {
                switch error {
                case .invalidURL:
                    self.error = error.localizedDescrpition
                case .decodingFailure:
                    self.error = error.localizedDescrpition
                }
            } else {
                if let pokemons = pokemons {
                    DispatchQueue.main.async {
                        self.pokemonsList = pokemons
                    }
                }
            }
        }
    }
    
    static func getBackgroundColor(forType type: String) -> Color {
        switch type {
        case "fire": return .red
        case "poison": return .purple
        case "flying": return .orange
        case "grass": return .green
        case "ground": return .brown
        case "normal": return .mustard
        case "fairy": return .lightPink
        case "fighting": return .beige
        case "electric": return .yellow
        case "psychic": return .lightPurple
        case "steel": return .lightGray
        case "ice": return .cyan
        case "rock": return .darkGray
        case "bug": return .darkGreen
        case "dragon": return .lightBlue
        case "water": return .blue
        default: return .green
        }
    }
}
