//
//  ContentView.swift
//  MilestoneProjects1-3_RockPaperScissors
//
//  Created by Minju Lee on 2021/12/16.
//

import SwiftUI

struct ContentView: View {
    private let emojis = ["✊","🖐","✌️"]
    @State private var choiceOfApp = Int.random(in: 0..<3)
    private let winOrLose = ["WIN", "LOSE"]
    @State private var shouldWin = true
    @State private var isCorrect = false
    @State private var questionNumber = 1
    @State private var o = 0
    @State private var x = 0
    @State private var score = 0
    @State private var showingScore = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .purple]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("No. \(questionNumber)")
                    .font(.title)
                    .padding()
                
                HStack {
                    Text("You have to")
                        .font(.bold(.largeTitle)())
                    Text(shouldWin ? winOrLose[0] : winOrLose[1])
                        .font(.bold(.largeTitle)())
                        .foregroundColor(.white)
                }
                
                Text(emojis[choiceOfApp])
                    .font(.system(size: 100))
                
                Spacer()
                
                Text("What's your choice?")
                    .font(.title2)
                
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            emojiTapped(number)
                        } label: {
                            Text(emojis[number])
                                .font(.system(size: 60))
                            
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        Text("⭕️ \(o)")
                            .foregroundColor(.white)
                            .font(.bold(.title)())
                        Text("❌ \(x)")
                            .foregroundColor(.white)
                            .font(.bold(.title)())
                    }
                    Text("Score : \(score)")
                        .font(.bold(.title)())
                }
                
                Spacer()
            }
            .alert("The End!\n Your Score \(score)", isPresented: $showingScore) {
                Button("Replay", action: reset)
            } message: {
                Text("⭕️ \(o) ❌ \(x)")
            }
        }
    }
    
    func emojiTapped(_ number: Int) {
        if shouldWin {
            if choiceOfApp == 0 && number == 1 || choiceOfApp == 1 && number == 2 || choiceOfApp == 2 && number == 0 {
                isCorrect = true
                o += 1
                score += 1
            } else {
                isCorrect = false
                x += 1
                score -= 1
            }
        } else {
            if choiceOfApp == 0 && number == 2 || choiceOfApp == 1 && number == 0 || choiceOfApp == 2 && number == 1 {
                isCorrect = true
                o += 1
                score += 1
            } else {
                isCorrect = false
                x += 1
                score -= 1
            }
        }
        
        if questionNumber < 10 {
            shouldWin.toggle()
            choiceOfApp = Int.random(in: 0..<3)
            questionNumber += 1
        } else {
            showingScore = true
        }
    }
    
    func reset() {
        choiceOfApp = Int.random(in: 0..<3)
        shouldWin = true
        isCorrect = false
        questionNumber = 1
        o = 0
        x = 0
        score = 0
        showingScore = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
