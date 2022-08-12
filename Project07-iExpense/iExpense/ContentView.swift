//
//  ContentView.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//

import SwiftUI

struct ContentView: View {
  static var allCategories = "All"
  
  @StateObject var expenses = Expenses()
  @State var showingAddExpense = false
  @State var category = ContentView.allCategories
  
  var categories = [ContentView.allCategories] + Expenses.types
  
    var body: some View {
      NavigationStack {
        Picker("Category", selection: $category) {
          ForEach(categories, id: \.self) {
            Text($0)
          }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 10)
        
        List {
          ForEach(expenses.items) { item in
            if (category == ContentView.allCategories || category == item.type) {
              
              HStack {
                VStack (alignment: .leading) {
                  Text(item.name)
                  Text(item.type)
                    .font(.caption)
                    .opacity(0.5)
                }
                
                Spacer()
                Text("\(item.amount.formatted(.currency(code: "USD")))")
                
              }
            }
          }
          .onDelete(perform: removeItems)
        }
        .navigationTitle("iExpense")
        .toolbar {
          ToolbarItem (placement: .navigationBarTrailing) {
            Button {
              showingAddExpense = true
            } label: {
              Image(systemName: "plus")
            }
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
