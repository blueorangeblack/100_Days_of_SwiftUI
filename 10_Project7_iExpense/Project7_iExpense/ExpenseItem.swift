//
//  ExpenseItem.swift
//  Project7_iExpense
//
//  Created by Minju Lee on 2022/03/12.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
