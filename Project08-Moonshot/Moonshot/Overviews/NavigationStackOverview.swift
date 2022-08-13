//
//  NavigationStackOverview.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import SwiftUI

struct NavigationStackOverview: View {
  var body: some View {
    NavigationView {
      List(0..<100) { row in
        
        NavigationLink {
          Text("Hello row #\(row)")
            .navigationTitle("Row #\(row)")
        } label: {
          Text("Row \(row)")
            .padding()
        }
      }
      .navigationTitle("SwiftUI")
    }
  }
}

struct NavigationStackOverview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackOverview()
    }
}
