//
//  Cards.swift
//  LabZ
//
//  Created by Daniel Alpizar on 25/9/21.
//

import Foundation

struct Data: Decodable, Identifiable{
    var id: String
    var name: String
    var images: Images
}



struct Images: Codable{
    var small: String
    var large: String
    
}



let MOCK_POKEMONL:[Data] = [
    .init(id: "gym2-2", name: "Blaine's Charizard", images: Images.init(small: "https://images.pokemontcg.io/gym2/2.png", large: "https://images.pokemontcg.io/gym2/2_hires.png"))
]

