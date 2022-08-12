//
//  ViewTransitions.swift
//  Animations
//
//  Created by Patt Martin on 8/11/22.
//

import SwiftUI

struct ViewTransitions: View {
  @State private var isShowingRectangle = false
  
    var body: some View {
      VStack {
        Button("Tap Me") {
          withAnimation {
            isShowingRectangle.toggle()
          }
        }
        .buttonStyle(.borderedProminent)
        .shadow(radius: 10)
        .zIndex(1)
        
        
        if isShowingRectangle {
          Rectangle()
            .fill(.linearGradient(Gradient(colors: [.indigo,  .mint]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .transition(.asymmetric(
              insertion: .scale.animation(.interpolatingSpring(stiffness: 120, damping: 20, initialVelocity: 20)),
              removal: .scale.animation(.easeOut)))
        }
      }
    }
}

struct ViewTransitions_Previews: PreviewProvider {
    static var previews: some View {
        ViewTransitions()
    }
}
