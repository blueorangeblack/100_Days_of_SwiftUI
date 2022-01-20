//
//  ContentView.swift
//  Project6_Animations_Challenge_GuessTheFlag
//
//  Created by Minju Lee on 2022/01/20.
//

import SwiftUI

struct FlagImage: View {
    var name: String

    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct LargeBlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueFont() -> some View {
        modifier(LargeBlueFont())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionNumber = 1
    @State private var theEnd = false
    
    @State private var selectedButtonNumber = 3
    @State private var rotationAmount = 0.0
    @State private var opacityValue = 1.0
    @State private var strokeColor: Color = .clear

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Quiz No. \(questionNumber)")
                    .foregroundColor(.white)
                    .font(.title3)
                
                Spacer()
                
                Text("Guess the Flag")
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(name: countries[number])
                        }
                        .overlay(
                            Capsule()
                                .stroke(selectedButtonNumber == number ? strokeColor : .clear, lineWidth: 3)
                        )
                        .rotation3DEffect(.degrees(selectedButtonNumber == number ? rotationAmount : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(selectedButtonNumber == number ? 1 : opacityValue)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("The End", isPresented: $theEnd) {
            Button("Replay", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedButtonNumber = number
        
        withAnimation {
            rotationAmount += 360
            opacityValue = 0.25
            if correctAnswer == selectedButtonNumber {
                strokeColor = .blue
            } else {
                strokeColor = .red
            }
        }
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong!\nThat’s the flag of \(countries[number])"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        selectedButtonNumber = 3
        opacityValue = 1.0
        strokeColor = .clear
        
        if questionNumber == 8 {
            theEnd = true
        } else {
            questionNumber += 1
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func reset() {
        questionNumber = 1
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
