//
//  Pokemon.swift
//  SwiftUI_Pokemon
//
//  Created by Kishan Nakum on 01/09/20.
//  Copyright © 2020 Digital Trons. All rights reserved.
//

import Foundation


struct Pokemon : Identifiable, Decodable{
    
    var id: String {pokemonName}
    
    let pokemonImage : String
    let pokemonName : String
    let pokemonType : String
    let typeColor : String
    let colorCode : String

}

extension Pokemon{
    static var readAllPokemon:[Pokemon] {
        let url = Bundle.main.url(forResource: "pokemon_dex", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let poke = try! JSONDecoder().decode([Pokemon].self, from: data)
        return poke
    }
}
