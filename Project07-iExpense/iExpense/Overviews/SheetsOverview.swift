//
//  SheetsOverview.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//

import SwiftUI

struct SecondView: View {
  @Environment(\.dismiss) var dismiss
  let name: String
  
  var body: some View {
    Text("Second View :)")
    Text("Hello \(name)")
    Button("Dismiss") {
      dismiss()
    }
    .padding()
  }
}

struct SheetsOverview: View {
  @State private var showingSheet = false
  
  var body: some View {
    Button("Show Sheet") {
      showingSheet.toggle()
    }
    .buttonStyle(.borderedProminent)
    .sheet(isPresented: $showingSheet) {
      SecondView(name: "Patt")
    }
  }
}

struct SheetsOverview_Previews: PreviewProvider {
  static var previews: some View {
    SheetsOverview()
  }
}
