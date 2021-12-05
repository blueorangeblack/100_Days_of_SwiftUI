//
//  ContentView.swift
//  ChallengeDay
//
//  Created by Minju Lee on 2021/12/05.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 1
    @State private var inputUnit: String = "m"
    @State private var outputUnit: String = "km"
    
    let units = ["m", "km", "ft", "yd", "mile"]
    
    var outputValue: Double {
        var m: Double = 0
        var result: Double = 0
        
        if inputUnit == "m" {
            m = inputValue
        } else if inputUnit == "km" {
            m = inputValue * 1000
        } else if inputUnit == "ft" {
            m = inputValue * 0.3048
        } else if inputUnit == "yd" {
            m = inputValue * 0.9144
        } else {
            m = inputValue * 1609.344
        }
        
        if outputUnit == "m" {
            result = m
        } else if outputUnit == "km" {
            result = m / 1000
        } else if outputUnit == "ft" {
            result = m / 0.3048
        } else if outputUnit == "yd" {
            result = m / 0.9144
        } else {
            result = m / 1609.344
        }

        return result
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(outputValue, format: .number)
                    Picker("", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Length Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
