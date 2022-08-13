//
//  ScrollViewOverview.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//
//  VStack and HStack create all views
//  LazyVStack and LazyHStack create views as they are shown and keep them if they go offscreen
//  LazyVStack and LazyHStack will expand to take up all available width and height

import SwiftUI

struct CustomText: View {
  let text: String
  
  init(_ text: String) {
    print("Creating TextView \" \(text)\"")
    self.text = text
  }
  
  var body: some View {
    Text(text)
  }
}

struct ScrollViewOverview: View {
  var body: some View {
    ScrollView (.vertical) {
      HStack {
        
        VStack {
          ForEach(0..<100) {
            CustomText("Regular Item \($0)")
              .font(.title)
          }
        }
        
        LazyVStack {
          ForEach(0..<100) {
            CustomText("Lazy Item \($0)")
              .font(.title)
          }
        }
      }
      .frame(maxWidth: .infinity)
    }
  }
}

struct ScrollViewOverview_Previews: PreviewProvider {
  static var previews: some View {
    ScrollViewOverview()
  }
}
