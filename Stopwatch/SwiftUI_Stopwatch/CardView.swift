//
//  CardView.swift
//  SwiftUI_Calculator
//
//  Created by Kishan Nakum on 05/10/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

struct CardView : View, Identifiable {
    let id = UUID()
    let num : Int
    let time : String

    init(n : Int, t : String){
        num = n
        time = t
    }

    var body: some View{

            ZStack() {

            HStack(alignment: .center,spacing: 15){
                
                Text("Lap \(self.num)")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white.opacity(0.7))
                    .padding()
                
                Spacer(minLength: 0)
                Text(self.time)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white.opacity(0.7))
                .padding()

            }
            }   .frame(width: screen.bounds.width - 40 , height: 60)
        .background(Color("Color2"))
        .cornerRadius(10)
        .shadow(color: Color.white.opacity(0.05), radius: 5, x: -5, y: -5)
        .shadow(color: Color.black.opacity(0.9), radius: 5, x: 5, y: 5)



    }
}
