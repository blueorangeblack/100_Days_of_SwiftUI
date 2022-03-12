//
//  ContentView.swift
//  Project7_iExpense
//
//  Created by Minju Lee on 2022/03/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    // AddView(sheet)가 표시되는지 여부
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                // 비용 제거
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            // 비용 추가하는 toolbar button 추가
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
