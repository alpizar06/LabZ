//
//  CardsViewModel.swift
//  LabZ
//
//  Created by Daniel Alpizar on 25/9/21.
//

import SwiftUI

class CardsViewModel: ObservableObject{
    
    struct Model: Decodable {
        var data: [Data]
        var page: Int
        var pageSize: Int
        var count: Int
        var totalCount: Int
    }

    @Published var cards = [Data]()
    
//    init(){
//        loadData()
//    }
    
    func loadData(pokemon: String){
        guard let url = URL(string: "https://api.pokemontcg.io/v2/cards?q=name:\(pokemon)") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(Model.self, from: data) {
                    DispatchQueue.main.async {
                        self.cards = response.data
                    }
                    return
                }
            }
        }.resume()
    }
}

