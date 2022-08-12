//
// OnDeleteOverview.swift
// iExpense
//
// Created by Patt Martin on 8/12/22.
//
// onDelete modifier ONLY exists on elements of ForEach of List

import SwiftUI

struct OnDeleteOverview: View {
  @State private var numbers = [Int]()
  @State private var currentNumber = 1
  
  var body: some View {
    NavigationStack {
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
      .navigationTitle(("onDelete()"))
      .toolbar {
        EditButton()
      }
    }
  }
  
  func removeRows(at offsets: IndexSet) {
    numbers.remove(atOffsets: offsets)
  }
}

struct OnDeleteOverview_Previews: PreviewProvider {
  static var previews: some View {
    OnDeleteOverview()
  }
}
