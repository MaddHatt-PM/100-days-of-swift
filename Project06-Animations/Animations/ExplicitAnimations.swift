//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Patt Martin on 8/10/22.
//

import SwiftUI

struct ExplicitAnimations: View {
  @State private var animationAmount = 0.0
  
    var body: some View {
      Button("Tap Me") {
        withAnimation (.interpolatingSpring(stiffness: 20, damping: 4)) {
          animationAmount += 360
        }
      }
      .padding(50)
      .background(.green)
      .foregroundColor(.white)
      .clipShape(Circle())
      .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.45, y: 0.8, z: 1))
    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}
