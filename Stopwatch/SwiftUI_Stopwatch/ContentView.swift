//
//  ContentView.swift
//  SwiftUI_Calculator
//
//  Created by Kishan Nakum on 11/09/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State var minutes  = 0
    @State var seconds = 0
    @State var centiseconds = 0
    @State var running = false
    @State var lapTimes : [CardView] = []
    @State var lapCount = 1
    @State var lapMinutes = 0
    @State var lapSeconds = 0
    @State var lapCentiseconds = 0
    
    
    var body: some View {
        VStack(){
            VStack{
                Text(getTimeString(cS: self.centiseconds, sS: self.seconds, mS: self.minutes))
                    .font(.system(size: 60, weight: Font.Weight.bold, design:Font.Design.monospaced))
                    .frame(width: 300.0, height: 100.0)
                    
                    .onReceive(self.timer){_ in
                        if(self.running){
                            self.timerCalculation()
                        }
                }
                HStack{
                    Button(action: {
                        if(!self.running){
                            self.minutes = 0
                            self.seconds = 0
                            self.centiseconds = 0
                            self.lapTimes = []
                            self.lapMinutes = 0
                            self.lapSeconds = 0
                            self.lapCentiseconds = 0
                            self.lapCount = 1
                        }
                        else{
                            
                            self.lapTimes.append(CardView(n: self.lapCount, t: getTimeString(cS: self.lapCentiseconds, sS: self.lapSeconds, mS: self.lapMinutes)))
                            self.lapCount += 1
                            self.lapMinutes = 0
                            self.lapSeconds = 0
                            self.lapCentiseconds = 0
                        }
                    }) {
                        ZStack{
                            Circle().fill(Color("Color2")).frame(width: 100, height: 100)  .background(Color("Color2"))
                                .cornerRadius(10)
                                .shadow(color: Color.white.opacity(0.05), radius: 5, x: -5, y: -5)
                                .shadow(color: Color.black.opacity(0.9), radius: 5, x: 5, y: 5)
                            
                            self.running ? Text("Lap").foregroundColor(Color.white).foregroundColor(Color.red)                        .fontWeight(.bold)
                                .font(.system(size: 25))
                                .foregroundColor(Color.white.opacity(0.7)) : Text("Reset").foregroundColor(Color.white).foregroundColor(Color.red)                        .fontWeight(.bold)
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.white.opacity(0.7))
                        }
                    }
                    
                    Spacer()
                    Button(action: {
                        self.running = !self.running
                    }) {
                        ZStack{
                            Circle().fill(Color("Color2")).frame(width: 100, height: 100).font(.system(size: 20, design: .monospaced))
                                .background(Color("Color2"))
                                .cornerRadius(10)
                                .shadow(color: Color.white.opacity(0.05), radius: 5, x: -5, y: -5)
                                .shadow(color: Color.black.opacity(0.9), radius: 5, x: 5, y: 5)
                            
                            Image(self.running ? "stop" : "start")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                                .shadow(color: Color.white.opacity(0.05), radius: 5, x: -5, y: -5)
                                .shadow(color: Color.black.opacity(0.9), radius: 5, x: 5, y: 5)
                            
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
                .padding(.bottom, 20)
                .background(
                    
                    ZStack(alignment: .topTrailing, content: {
                        
                        LinearGradient(gradient: .init(colors: [Color("Color1"),Color("Color")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        
                    }
                    )            .edgesIgnoringSafeArea(.top)
                    
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 10) {
                    
                    ForEach(self.lapTimes.reversed()){item in
                        GeometryReader { (proxy: GeometryProxy) in
                            
                            item
                                .shadow(color: Color.black.opacity(0.16), radius: 5, x: 0, y: 5)
                        }.frame(width: screen.bounds.width - 40 , height: 60)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }        .background(Color("Color2").edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.top)
            .shadow(color: Color.white.opacity(0.05), radius: 5, x: -5, y: -5)
            .shadow(color: Color.black.opacity(0.9), radius: 5, x: 5, y: 5)
        
        
    }
    
    
    func timerCalculation(){
        if(self.centiseconds < 99){
            self.centiseconds += 1
        }
        else{
            self.centiseconds = 0
            if(self.seconds < 59){
                self.seconds += 1
            }
            else{
                self.seconds = 0
                self.minutes += 1
            }
        }
        
        if(self.lapCentiseconds < 99){
            self.lapCentiseconds += 1
        }
        else{
            self.lapCentiseconds = 0
            if(self.lapSeconds < 59){
                self.lapSeconds += 1
            }
            else{
                self.lapSeconds = 0
                self.lapMinutes += 1
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





