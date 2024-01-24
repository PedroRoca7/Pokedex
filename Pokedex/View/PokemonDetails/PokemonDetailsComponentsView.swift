//
//  PokemonDetailsComponentsView.swift
//  Pokedex
//
//  Created by Pedro Henrique on 23/01/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct PickerView : View {
    
    @Binding var selected: Int
    
    var body : some View {
        Picker(selection: $selected, label: Text("Picker"), content: {
            Text("About").tag(1)
            Text("Base Stats").tag(2)
            Text("Evolutions").tag(3)
        })
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct AboutPokemonView : View {
    var valueHeight: Int
    var valueWeight: Int
    var descriptionPokemon: String
    
    var body : some View {
      
        Text("Description")
            .font(.largeTitle)
        
        Text(descriptionPokemon)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .frame(maxHeight: 150)
            
        
        HStack {
            Text("Heigth")
                .foregroundColor(.gray)
                .padding(.leading, 40)
                .padding(.top, 30)
            Spacer()
            Text(String(valueHeight))
                .padding(.trailing, 150)
                .padding(.top, 30)
        }
        .padding(.bottom, 5)
        HStack {
            Text("Weigth")
                .foregroundColor(.gray)
                .padding(.leading, 40)
            Spacer()
            Text(String(valueWeight))
                .padding(.trailing, 150)
        }
    }
}

struct BaseStatsPokemonView: View {
    var attackValue: Int
    var defenseValue: Int

    var body: some View {
        HStack {
            Text("Attack")
                .foregroundColor(.gray)
                .padding(.leading, 20)
            Spacer()
            Text(String(attackValue))
                .padding(.trailing, 20)
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 150, height: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                Rectangle()
                    .frame(width: CGFloat(attackValue), height: 10)
                    .foregroundColor(getColorBaseStats(value: attackValue))
                    .padding(.trailing, 10)
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 5)
        HStack {
            Text("Defense")
                .foregroundColor(.gray)
                .padding(.leading, 20)
            Spacer()
            Text(String(defenseValue))
                .padding(.trailing, 20)
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 150, height: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                Rectangle()
                    .frame(width: CGFloat(defenseValue), height: 10)
                    .foregroundColor(getColorBaseStats(value: defenseValue))
                    .padding(.trailing, 10)
            }
        }
        .padding(.bottom, 232)
    }
    
    private func getColorBaseStats(value: Int) -> Color {
        if value > 75 {
            return Color.green
        } else {
            return Color.red
        }
    }
}

struct EvolutionsPokemonView: View {
    var pokemon: Pokemon
    var listPokemons: [Pokemon]
    
    var body : some View {
        KFImage(URL(string: getImageEvolutionPokemon(id: pokemon.evolutionChain?[0].id ?? "", listPokemons: listPokemons)))
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        Text(pokemon.evolutionChain?[0].name.capitalized ?? "").bold()
        Image(checkPokemonEvolution(pokemon: pokemon))
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        if pokemon.evolutionChain?.count ?? 0 > 1  {
            KFImage(URL(string: getImageEvolutionPokemon(id: pokemon.evolutionChain?[1].id ?? "", listPokemons: listPokemons)))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text(pokemon.evolutionChain?[1].name.capitalized ?? "").bold()
                .padding(.bottom, -12)
        }
    }
    
    private func checkPokemonEvolution(pokemon: Pokemon) -> String {
        if pokemon.evolutionChain?[0] != nil {
            return "ArrowDown"
        } else {
            return "PontodeInterrogacao"
        }
    }
    
    private func getImageEvolutionPokemon(id: String, listPokemons: [Pokemon]) -> String {
        let idInt = Int(id)
        if let pokemonFilter = listPokemons.first(where: { $0.id == idInt}) {
            return pokemonFilter.imageUrl
        } else {
            return ""
        }
    }
}

struct TypeAndIdView : View {
    var text: String
    
    var body : some View {
        Text(text)
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
}
