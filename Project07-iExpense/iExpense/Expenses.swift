//
//  Expenses.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//

import Foundation

class Expenses: ObservableObject {
  static let types = ["Business", "Personal"]
  
  @Published var items = [ExpenseItem]() {
    didSet {
      let encoder = JSONEncoder()
      
      if let encoded = try? encoder.encode(items) {
        UserDefaults.standard.set(encoded, forKey: "Items")
      }
    }
  }
  
  init() {
    // Attempt to read back data
    // [ExpenseItem].self is the same as calling type([ExpenseItem]) in python
    if let savedItems = UserDefaults.standard.data(forKey: "Items") {
      if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
        items = decodedItems
        return
      }
    }
    
    items = []
  }
}
