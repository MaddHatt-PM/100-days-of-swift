//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//

/*
 Notes:
  Identifiable protocol lets Swift know that the element is always unique. id: is no longer needed for forEach()
 
 
 */

import Foundation

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  let name: String
  let type: String
  let amount: Double
}
