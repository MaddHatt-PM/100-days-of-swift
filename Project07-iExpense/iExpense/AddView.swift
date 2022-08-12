//
//  AddView.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//

import SwiftUI

struct AddView: View {
  @Environment(\.dismiss) var dismiss
  
  enum Field: Hashable {
    case name
    case eType
    case amount
  }
  @FocusState private var focusedField: Field?
  
  @ObservedObject var expenses: Expenses
  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount: Double?
  
  
  var currencyFormat: String {
    Locale.current.currency?.identifier ?? "USD"
  }
  
  var body: some View {
    NavigationStack {
      
      List {
        Section {
          
          TextField("Name", text: $name)
            .focused($focusedField, equals: .name)
            .onAppear {
              focusedField = .name
            }
          
          Picker("Type", selection: $type) {
            ForEach(Expenses.types, id: \.self) {
              Text($0)
            }
          }
          Section {
            
            HStack {
              Text("Amount")
              
              Spacer()
              
              TextField("0.00", value: $amount, format: .currency(code: currencyFormat))
                .fixedSize()
                .keyboardType(.decimalPad)
            }
          }
        }
      }
      .navigationTitle("Add expense")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Save") {
            let item = ExpenseItem(name: name, type: type, amount: amount!)
            expenses.items.insert(item, at: 0)
            dismiss()
          }
          .disabled(disableSave)
        }
      }
    }
  }
  
  var disableSave: Bool {
    return (name == "" || amount ?? 0.0 == 0.0)
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    AddView(expenses: Expenses())
  }
}
