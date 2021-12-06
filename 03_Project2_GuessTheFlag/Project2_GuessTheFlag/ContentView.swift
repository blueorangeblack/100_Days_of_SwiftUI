//
//  ContentView.swift
//  Project2_GuessTheFlag
//
//  Created by Minju Lee on 2021/12/06.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Your content")
//                .foregroundColor(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
//        VStack {
//            Button("Button 1") { } .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { } .buttonStyle(.bordered)
//                .tint(.mint)
//            Button("Button 4") { } .buttonStyle(.borderedProminent)
//            Button("Button 5", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//            Button("Button 6") { } .buttonStyle(.borderedProminent) .tint(.mint)
//        }
        
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
