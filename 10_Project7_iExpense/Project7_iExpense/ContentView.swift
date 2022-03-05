//
//  ContentView.swift
//  Project7_iExpense
//
//  Created by Minju Lee on 2022/03/05.
//

import SwiftUI
/*
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
*/

/*
struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String

    var body: some View {
        //Text("Hello, \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    // 1. sheet가 표시되는지 여부를 추적하기 위한 State가 필요
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            // 2. 버튼을 누를 때마다 토글
            showingSheet.toggle()
        }
        // 3. 뷰 계층의 어딘가에 시트 첨부하기
        .sheet(isPresented: $showingSheet) {
            // 4. sheet에 무엇이 포함되어야 하는지 결정
            SecondView(name: "Harry")
        }
    }
}
*/

/*
struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}
*/

/*
struct ContentView: View {
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("Tap") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}
*/

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")

    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
