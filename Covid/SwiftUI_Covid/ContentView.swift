//
//  ContentView.swift
//  SwiftUI_Covid
//
//  Created by Kishan Nakum on 08/09/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selected = false
    @State var cartItems: [(index: Int, anchor: Anchor<CGPoint>)] = []
    @State var progressValue: Float = 0.0
    @State var spin = false

    var body: some View {
    GeometryReader { proxy in

        VStack{
/*-------------------------------------------------------------------------------------------------------------------------------------------
        // MARK: - Progressbar
------------------------------------------------------------------------------------------------------------------------------------------- */

            ProgressBar(value: self.$progressValue).frame(height: 30)
                .padding()
/*-------------------------------------------------------------------------------------------------------------------------------------------
        // MARK: - Corona Image section
------------------------------------------------------------------------------------------------------------------------------------------- */

            VStack{
            ZStack{
                    Image("05")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: UIScreen.main.bounds.width/2, height:  UIScreen.main.bounds.width/3, alignment: .center)
                     .padding()
                        .rotation3DEffect(.degrees(self.spin ? 360: 1), axis: (x: 0, y:0 , z: self.spin ? 1: 0))
                        .animation(Animation.easeOut(duration: 15).repeatForever(autoreverses: false))
                        .onAppear(){
                        self.spin.toggle()
                            }
                    .opacity(self.progressValue > 1 ? 0 : 1)
                    .background (
            GeometryReader { proxy in
                ZStack {
                    ForEach(Array(self.cartItems.enumerated()), id: \.offset) { (_, item) in
                    Image("07")
                            .animation(.default)
                            .transition(.offset(x: proxy[item.anchor].x, y: proxy[item.anchor].y))
                            .onAppear{
                            
                        }
                    .zIndex(5)
                    }
                }
            }.frame(width: 50, height: 50)
                )
                .offset(x: self.selected ? -2 : 0)
                .animation(Animation.default.repeatCount(5).speed(6))
            }
            .foregroundColor(Color(.gray))
            .padding(.vertical)
            Text(self.progressValue > 1 ? "You are safe Now." : "Remove Corona Germs!")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .frame(width: UIScreen.main.bounds.width - 30, height:  20, alignment: .center)
                .foregroundColor(Color(.black))
            }
/*-------------------------------------------------------------------------------------------------------------------------------------------
        // MARK: - Cards View
------------------------------------------------------------------------------------------------------------------------------------------- */

            VStack{
        HStack{
            ForEach(0..<2){ index in
                ItemView(itemName: icons[index], instruction: instructions[index])
                .anchorPreference(key: AnchorKey.self, value: .topLeading, transform: { $0 })
                //Uses the specified preference value from the view to produce another view as an overlay atop the first view.
                .overlayPreferenceValue(AnchorKey.self, { anchor in
                    Button(action: {
                        if self.progressValue <= 1{
                        withAnimation(Animation.default.speed(0.55)){
                            self.progressValue += 0.05
                        }
                        self.selected.toggle()
                        self.cartItems.append((index: index, anchor: anchor!))
                        }
                    }, label: { Color.clear })
                })

            }
        }
        .padding(.top,5)
            HStack{
                ForEach(2..<4){ index in
                    ItemView(itemName: icons[index], instruction: instructions[index])
                    .anchorPreference(key: AnchorKey.self, value: .topLeading, transform: { $0 })
                    //Uses the specified preference value from the view to produce another view as an overlay atop the first view.
                    .overlayPreferenceValue(AnchorKey.self, { anchor in
                        Button(action: {
                            if self.progressValue <= 1{
                            withAnimation(Animation.default.speed(0.55)){
                                self.progressValue += 0.05
                            }
                            self.selected.toggle()
                            self.cartItems.append((index: index, anchor: anchor!))
                            }
                        }, label: { Color.clear })
                    })

                }
            }
            .padding(.top,5)
            }
        }}
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: AppColors.bgGradient1),Color(hex: AppColors.bgGradient2)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct AnchorKey: PreferenceKey {
    typealias Value = Anchor<CGPoint>?
    static var defaultValue: Value { nil }
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


