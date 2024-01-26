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
        VStack {
            Text("Description")
                .font(.largeTitle)
            Text(descriptionPokemon)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text("Heigth")
                        .foregroundColor(.gray)
                        .padding(.leading, -150)
                    Text(String(valueHeight))
                }
                HStack {
                    Text("Weigth")
                        .foregroundColor(.gray)
                        .padding(.leading, -150)
                    Text(String(valueWeight))
                }
            }
        }
    }
}

struct BaseStatsPokemonView: View {
    var attackValue: Int
    var defenseValue: Int
    
    var body: some View {
        
        VStack {
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
        }
        .padding(.top, 10)
        Spacer()
    }
    
    private func getColorBaseStats(value: Int) -> Color {
        if value > 75 {
            return Color.green
        } else {
            return Color.red
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
