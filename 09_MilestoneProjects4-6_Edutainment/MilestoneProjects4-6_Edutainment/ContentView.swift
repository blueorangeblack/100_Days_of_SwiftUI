//
//  ContentView.swift
//  MilestoneProjects4-6_Edutainment
//
//  Created by Minju Lee on 2022/02/02.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSettings = true
    
    private let dans = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    private let numberOfQuestions = [5, 10, 20]
    
    @State private var selectedDan = 2
    @State private var selectedNumOfQuestion = 5
    
    @State private var num = Int.random(in: 1...9)
    @State private var playerAanswer: Int? = nil
    @State private var o = 0
    @State private var x = 0
    @State private var correct = false
    @State private var wrong = false
    @State private var score = 0
    @State private var questionNumber = 1
    
    @FocusState private var textfieldFocused: Bool
    @State private var theEnd = false
        
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            VStack {
                if showingSettings {
                    VStack {
                        Text("Multiplication Tables")
                            .font(.largeTitle.bold())
                        
                        VStack {
                            Text("Choose the table ! (2~12)")
                                .font(.title3.bold())
                                .foregroundColor(.mint)
                            Stepper("\(selectedDan)", value: $selectedDan, in: 2...12, step: 1)
                                .font(.title3)
                                .padding()
                        }
                        .padding(.vertical, 10)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack {
                            Text("Choose the number of questions !")
                                .font(.title3.bold())
                                .foregroundColor(.mint)
                            Picker("Number of Questions", selection: $selectedNumOfQuestion) {
                                ForEach(numberOfQuestions, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding()
                        }
                        .padding(.vertical, 10)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Button ("START") {
                            withAnimation {
                                showingSettings.toggle()
                            }
                        }
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.mint)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                    }
                    .padding()
                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))
                } else {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Question \(questionNumber) / \(selectedNumOfQuestion)")
                                .font(.title3.bold())
                                .foregroundColor(.mint)
                            
                            Spacer()
                            
                            Text("⭕️ \(o)  ❌ \(x)")
                                .font(.title3.bold())
                        }
                        
                        ZStack {
                            Text("\(selectedDan) X \(num) = ?")
                                .font(Font.system(size: 50).bold())
                                .foregroundColor(.yellow)
                                .padding()
                            
                            Image(systemName: "circle")
                                .foregroundColor(.blue)
                                .scaleEffect(correct ? 5 : 0)
                                .opacity(correct ? 0 : 1)
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                                .scaleEffect(wrong ? 5 : 0)
                                .opacity(wrong ? 0 : 1)
                        }
                        
                        VStack {
                            TextField("Enter your answer", value: $playerAanswer, format: .number)
                                .focused($textfieldFocused)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            Button ("CHECK") {
                                check()
                            }
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(.mint)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        }
                    }
                    .padding()
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
            .alert("The End", isPresented: $theEnd) {
                Button("OK", action: reset)
            } message: {
                Text("⭕️ \(o)  ❌ \(x)")
            }
        }
    }
    
    func check() {
        correct = false
        wrong = false
        
        let correctAnswer = selectedDan * num
        if playerAanswer == correctAnswer {
            o += 1
            withAnimation(.linear(duration: 0.5)) {
                correct = true
            }
        } else {
            x += 1
            withAnimation(.linear(duration: 0.5)) {
                wrong = true
            }
        }
        
        if questionNumber == selectedNumOfQuestion {
            textfieldFocused = false
            theEnd = true
            return
        }
        
        questionNumber += 1
        num = Int.random(in: 1...9)
    }
    
    func reset() {
        withAnimation {
            showingSettings.toggle()
        }

        selectedDan = 2
        selectedNumOfQuestion = 5
        
        playerAanswer = nil
        o = 0
        x = 0
        score = 0
        questionNumber = 1
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//"Designed by Freepik"
