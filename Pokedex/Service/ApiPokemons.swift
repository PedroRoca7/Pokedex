//
//  ApiPokemons.swift
//  Pokedex
//
//  Created by Pedro Henrique on 22/01/24.
//

import Foundation

enum errorApi {
    case invalidURL
    case decodingFailure
    
    var localizedDescrpition : String {
        switch self {
        case .invalidURL:
            return "URL inválida."
        case .decodingFailure:
            return "Falha na decodificação"
        }
    }
}

class ApiPokemons {
    private let baseUrl: String = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchPokemons(completion: @escaping([Pokemon]?, errorApi?) -> Void) {
        guard let url = URL(string: baseUrl) else {
            completion(nil, errorApi.invalidURL)
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data?.parseData(removeString: "null,") else { return }
            if let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) {
                completion(pokemon, nil)
            } else {
                completion(nil, errorApi.decodingFailure)
            }
        }.resume()
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
