//
//  Array+Extensions.swift
//  Pokedex
//
//  Created by Pedro Henrique on 24/01/24.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
