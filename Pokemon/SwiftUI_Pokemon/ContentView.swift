//
//  ContentView.swift
//  SwiftUI_Pokemon
//
//  Created by Kishan Nakum on 01/09/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let allPokemon = Pokemon.readAllPokemon
    
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                VStack(alignment: .leading, spacing: 24) {
/*-------------------------------------------------------------------------------------------------------------------------------------------
            // MARK: - HEADER IMAGE
------------------------------------------------------------------------------------------------------------------------------------------- */

                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal,80)
/*-------------------------------------------------------------------------------------------------------------------------------------------
            // MARK: - COROUSAL VIEW
------------------------------------------------------------------------------------------------------------------------------------------- */

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(self.allPokemon) { poke in
                                GeometryReader { (proxy: GeometryProxy) in
                                    PokeCard(pokemon:poke)
                                        .rotation3DEffect(.degrees(Double(proxy.frame(in: .global).minX - 20) / -20), axis: (x: 0, y: 1, z: 0))
                                        .onTapGesture {
                                            withAnimation(Animation.spring()) {
                                            }
                                    }
                                }
                                .frame(width: screen.bounds.width * 0.75, height: screen.bounds.height * 0.60)
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                    
                }
            }
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: AppColors.bgGradient3),Color(hex: AppColors.bgGradient4)]), startPoint: .top, endPoint: .bottom))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

/*-------------------------------------------------------------------------------------------------------------------------------------------
 // MARK: - PREVIEW
------------------------------------------------------------------------------------------------------------------------------------------- */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
