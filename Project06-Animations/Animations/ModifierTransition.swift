//
//  ModifierTransition.swift
//  Animations
//
//  Created by Patt Martin on 8/11/22.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
  let amount: Double
  let anchor: UnitPoint
  
  func body(content: Content) -> some View {
    content
      .rotationEffect(.degrees(amount), anchor: anchor)
      .clipped()
  }
}

extension AnyTransition {
  static var pivot: AnyTransition {
    .modifier(
      active: CornerRotateModifier(amount: -90, anchor: .topLeading),
      identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
  }
}

struct ModifierTransition: View {
  @State private var isShowingGreen = false
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .fill(.blue)
        .frame(width: 300, height: 200)
      
      if isShowingGreen {
        RoundedRectangle(cornerRadius: 20)
          .fill(.green)
          .frame(width: 300, height: 200)
          .transition(.pivot)
      }
    }
    .onTapGesture {
      withAnimation {
        isShowingGreen.toggle()
      }
    }
  }
}

struct ModifierTransition_Previews: PreviewProvider {
  static var previews: some View {
    ModifierTransition()
  }
}
