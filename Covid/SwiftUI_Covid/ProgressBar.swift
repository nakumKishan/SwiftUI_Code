//
//  ProgressBar.swift
//  SwiftUI_Covid
//
//  Created by Kishan Nakum on 08/09/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(hex: "#dd546e"))
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(hex: "#dd546e"))
                    .animation(.linear)
                Text("\(Int((self.value)*100))% Germs Killed.")
                    .frame(width: geometry.size.width, height:  20, alignment: .center)
                    .foregroundColor(Color(.white))
            }.cornerRadius(45.0)
        }
    }
}
