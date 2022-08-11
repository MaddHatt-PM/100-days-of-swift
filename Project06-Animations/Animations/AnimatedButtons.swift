//
//  ContentView.swift
//  Animations
//
//  Created by Patt Martin on 8/10/22.
//

import SwiftUI

struct AnimatedButtons: View {
  @State private var anim1Amount = 1.0
  @State private var anim2Amount = 1.0
  
  var body: some View {
    
    NavigationStack{
      Spacer()
      Button("test") {
      }
      .padding(50)
      .background(.cyan)
      .foregroundColor(.white)
      .clipShape(Circle())
      .overlay(
        Circle()
          .stroke(.cyan, lineWidth: 1)
          .scaleEffect(anim1Amount)
          .opacity(2 - anim1Amount)
          .animation(
            .easeInOut(duration: 1.5)
            .repeatForever(autoreverses: false),
            value: anim1Amount
          )
      )
      .onAppear {
        anim1Amount = 2
      }
      
      Spacer()
      
      Button("Tap Me Too!") {
        anim2Amount += 1
      }
      .padding(50)
      .background(.red)
      .foregroundColor(.white)
      .clipShape(Circle())
      .scaleEffect(anim2Amount)
      .blur(radius: (anim2Amount - 1) * 3)
      .animation(.interpolatingSpring(stiffness: 500, damping: 30), value: anim2Amount)
      
      Spacer()
      
      // Toolbar Items
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              anim2Amount = 1
            } label: {
              Text("Reset")
            }
            
          }
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedButtons()
  }
}
