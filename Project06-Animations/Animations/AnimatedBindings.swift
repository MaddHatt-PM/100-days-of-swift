//
//  AnimatedBindings.swift
//  Animations
//
//  Created by Patt Martin on 8/10/22.
//

import SwiftUI

struct AnimatedBindings: View {
  @State private var animationAmount = 1.0
  
  var body: some View {
    print(animationAmount)
    
    return VStack {
      Spacer()
      
      Stepper("Scale amount", value: $animationAmount.animation(
        .easeInOut(duration: 0.5)
        .repeatCount(3, autoreverses: true)
      ), in: 1...10)
      
      Spacer()
      
      Button("Tap me") {
        animationAmount += 1
      }
      .padding(50)
      .background(.red)
      .foregroundColor(.white)
      .clipShape(Circle())
      .zIndex(-100)
      .scaleEffect(animationAmount)
      
      
      
      Spacer()
    }
  }
}

struct AnimatedBindings_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedBindings()
  }
}
