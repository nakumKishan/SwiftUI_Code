//
//  Calculations.swift
//  SwiftUI_Calculator
//
//  Created by Kishan Nakum on 05/10/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI


func getTimeString(cS: Int, sS : Int, mS: Int) -> String{
    var centiString = String(cS)
    var secString = String(sS)
    var minString = String(mS)
    if(cS<10){
        centiString = "0\(cS)"
    }
    if(sS<10){
        secString = "0\(sS)"
    }
    if(mS<10){
        minString = "0\(mS)"
    }
    return "\(minString):\(secString).\(centiString)"
}

