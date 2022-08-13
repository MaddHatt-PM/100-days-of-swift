//
//  ScrollingGridLayoutOverview.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import SwiftUI

struct ScrollingGridLayoutOverview: View {
  let fixedLayout = [
    GridItem(.fixed(80)),
    GridItem(.fixed(80)),
    GridItem(.fixed(80))
  ]
  
  let layout = [
    GridItem(.adaptive(minimum: 80))
  ]
  
    var body: some View {
      // For horizontal: set ScrollView (.horizontal) and use LazyHGrid
      ScrollView {
        LazyVGrid(columns: layout) {
          ForEach(0..<1000) {
            Text("Item \($0)")
          }
        }
      }
    }
}

struct ScrollingGridLayoutOverview_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGridLayoutOverview()
    }
}
