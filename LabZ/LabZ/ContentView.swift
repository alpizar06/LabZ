//
//  ContentView.swift
//  LabZ
//
//  Created by Daniel Alpizar on 25/9/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    @ObservedObject var viewModel = CardsViewModel()
    @State var pokemon = "search"
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("Search", text: $pokemon)
                        .disableAutocorrection(true)
                        .padding(8)
                        .font(.headline)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(6)
                        .padding(.horizontal,10)
                        .onChange(of: pokemon, perform:{ value in viewModel.loadData(pokemon: pokemon)})
                    Spacer()
                }
                ScrollView{
                    LazyVGrid(columns: gridItems, spacing: 10) {
                        ForEach(viewModel.cards){ card in
    //                        NavigationLink(
    //                            destination: PokemonInfo(pokemon: pokemon)){

                            KFImage(URL(string: card.images.small))
                                .resizable()
                                .scaledToFit()
                                //}
                        }
                    }
                }
                .navigationTitle("TCG")
            }
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
