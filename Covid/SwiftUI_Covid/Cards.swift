//
//  Cards.swift
//  SwiftUI_Covid
//
//  Created by Kishan Nakum on 08/09/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

struct ItemView : View {
    let itemName: String
    let instruction : String


    var body: some View{
       Rectangle()
        .fill(Color(.lightText))
        .frame(width: 140, height: 120, alignment: .center)
        .overlay(
            VStack{
        Image(itemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60, alignment: .center)
            .foregroundColor(.white)
            .padding(.vertical,10)
        Text (instruction)
                .font(.system(size: 13, weight: .semibold, design: .monospaced))
            }
        )
        .border(Color.black , width: 1)
    }
}
