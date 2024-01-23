//
//  PokemonDetailsComponentsView.swift
//  Pokedex
//
//  Created by Pedro Henrique on 23/01/24.
//

import Foundation
import SwiftUI

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
    var valueHeight: String
    var valueWeight: String
    
    var body : some View {
      
        Text("Description")
            .font(.largeTitle)
        
        Text("Bulbasaur can be seen napping in bright sunlight.There is a seed on its back. By soaking up the sun’s rays,the seed grows progressively larger.")
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .frame(maxHeight: 150)
            
        
        HStack {
            Text("Heigth")
                .foregroundColor(.gray)
                .padding(.leading, 40)
                .padding(.top, 30)
            Spacer()
            Text(valueHeight)
                .padding(.trailing, 150)
                .padding(.top, 30)
        }
        .padding(.bottom, 5)
        HStack {
            Text("Weigth")
                .foregroundColor(.gray)
                .padding(.leading, 40)
            Spacer()
            Text(valueWeight)
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
                    .frame(width: 200, height: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                Rectangle()
                    .frame(width: CGFloat(attackValue), height: 10)
                    .foregroundColor(.red)
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
                    .frame(width: 200, height: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                Rectangle()
                    .frame(width: CGFloat(defenseValue), height: 10)
                    .foregroundColor(.green)
                    .padding(.trailing, 10)
            }
        }
        .padding(.bottom, 232)
    }
}

struct EvolutionsPokemonView: View {
    
    var body : some View {
        Image(systemName: "car")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        Text("Ivysaur").bold()
        Image(systemName: "car")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        Image(systemName: "car")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        Text("Venosaur").bold()
            .padding(.bottom, -12)
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
