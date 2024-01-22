//
//  Pokemon.swift
//  Pokedex
//
//  Created by Pedro Henrique on 22/01/24.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POCKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "car", type: "poison"),
    .init(id: 1, name: "Charmander", imageUrl: "car", type: "fairy"),
]
