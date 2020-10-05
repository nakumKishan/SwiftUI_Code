//
//  ItemView.swift
//  SwiftUI_Calculator
//
//  Created by Kishan Nakum on 05/10/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

struct LapTime : View, Identifiable{
    let id = UUID()
    let num : Int
    let time : String
    
    var body : some View{
        HStack{
            Text("Lap \(num)").font(.system(size: 20, design: .monospaced))
            Spacer()
            Text(time).font(.system(size: 20, design: .monospaced))
        }
    }
    
    init(n : Int, t : String){
        num = n
        time = t
    }
}
