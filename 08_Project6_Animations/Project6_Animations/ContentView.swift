//
//  ContentView.swift
//  Project6_Animations
//
//  Created by Minju Lee on 2022/01/09.
//

import SwiftUI

struct ContentView: View {
    /*
    @State private var animationAmount = 1.0
   
    var body: some View {
        //⭐️Creating implicit animations
        
        /*
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
        
        //⭐️customizing animations
        //.animation(.easeOut, value: animationAmount)
        
        //.animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        
        //duration
        //.animation(.easeInOut(duration: 2), value: animationAmount)
        
        //delay
        /*
        .animation(
            .easeInOut(duration: 2)
                .delay(1),
            value: animationAmount
        )
         */
        
        //repeat, autoreverse
        /*
        .animation(
            .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true),
            value: animationAmount
        )
         */
        
        //repeatForever
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
         */
        
        /*
        //.onAppear, .repeatForever
        Button("animation") { }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
         */
        
        /*
        //⭐️animating bindings
        print(animationAmount)
        
        return VStack {
            
            Stepper("Scale amount",value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
         */
    }
    */
    
    //⭐️explicit animations
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        Button("Tap Me") {
            /*
            withAnimation {
                animationAmount += 360
            }
             */
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
