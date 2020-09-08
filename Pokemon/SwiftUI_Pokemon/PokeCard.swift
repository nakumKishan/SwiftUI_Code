//
//  CardView.swift
//  SwiftUI_Pokemon
//
//  Created by Kishan Nakum on 01/09/20.
//  Copyright © 2020 Digital Trons. All rights reserved.
//

import SwiftUI


struct PokeCard: View {
    var pokemon : Pokemon
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ZStack(alignment: .bottom) {
                    VStack{
                        Image("ball")
                            .resizable()
                            .offset(x:screen.bounds.width/2 - 80)
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding(.top,20)
                            .shadow(color: .black,radius: 5)
/*-------------------------------------------------------------------------------------------------------------------------------------------
        // MARK: - Pokemon Image
------------------------------------------------------------------------------------------------------------------------------------------- */
                        
                        Image(self.pokemon.pokemonImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal,50)
                            .padding(.vertical)
                            .padding(.top,-30)
                            .shadow(color: Color(hex: self.pokemon.colorCode),radius: 10)
                        
/*-------------------------------------------------------------------------------------------------------------------------------------------
        // MARK: - Pokemon Name
------------------------------------------------------------------------------------------------------------------------------------------- */
                        
                        Text(self.pokemon.pokemonName)
                            .font(.system(size: 40, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)
                            .shadow(color: Color(hex: self.pokemon.colorCode),radius: 10)
                            .padding()
/*-------------------------------------------------------------------------------------------------------------------------------------------
        // MARK: - Bottom View
------------------------------------------------------------------------------------------------------------------------------------------- */
                        
                        HStack{
                            Text(self.pokemon.pokemonType)
                                .font(.system(size: 15, weight: .bold, design: .monospaced))
                                .frame(width: 100,height: 30)
                                .background(Color(hex: self.pokemon.typeColor).opacity(1))
                            
                        }
                        .padding()
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                        .frame(width: screen.bounds.width * 0.75)
                        .background(Color.black.opacity(0.5))
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(hex: AppColors.bgGradient1),Color(hex: AppColors.bgGradient2)]), startPoint: .top, endPoint: .bottom))
                .border(LinearGradient(gradient: Gradient(colors: [Color(hex: AppColors.bgGradient5),Color(hex: AppColors.bgGradient6)]), startPoint: .top, endPoint: .bottom), width: 5)
                .frame(width: screen.bounds.width * 0.75, height: screen.bounds.height * 0.60)
                .cornerRadius(16)
                .shadow(color:Color(hex: "#2aead3"),radius: 8)
                
            }
        }
    }
}
struct PokeCard_Previews: PreviewProvider {
    static var previews: some View {
        PokeCard(pokemon:Pokemon.readAllPokemon[2])
    }
}
