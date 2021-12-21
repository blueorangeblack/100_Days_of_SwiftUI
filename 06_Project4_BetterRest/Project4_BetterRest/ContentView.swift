//
//  ContentView.swift
//  Project4_BetterRest
//
//  Created by Minju Lee on 2021/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        /*
        //Stepper
        //1씩 증가, 감소
        Stepper("\(sleepAmount) hours", value: $sleepAmount)

        //in 범위지정
        Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
        
        //step 증가, 감소하는 값 지정
        Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12, step: 0.25)
         
        //formatted()
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
         */
        
        /*
        //DatePicker
        DatePicker("Please enter a date", selection: $wakeUp)
        
        //labelsHidden()
        DatePicker("Please enter a date", selection: $wakeUp)
            .labelsHidden()
        
        //displayedComponents
        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
        
        //in
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
         */
        
        /*
        //dateComponents
        Text(Date.now, format: .dateTime.hour().minute())
        
        Text(Date.now, format: .dateTime.day().month().year())
         */
        Text(Date.now.formatted(date: .long, time: .shortened))
        /*
        Text(Date.now.formatted(date: .long, time: .omitted))
         */
    }
    
    /*
    func trivialExample() {
        /*
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        //let date = Calendar.current.date(from: components)
        let date = Calendar.current.date(from: components) ?? Date.now
         */
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
     */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
