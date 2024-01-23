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
    .init(id: 0, name: "Bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "poison"),
    .init(id: 1, name: "Charmander", imageUrl: "car", type: "fire"),
]
