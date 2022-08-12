//
//  AnimationsApp.swift
//  Animations
//
//  Created by Patt Martin on 8/10/22.
//

import SwiftUI

enum availableViews: String, CaseIterable {
  case Button = "Implicit Buttons"
  case Bindings = "Animated Bindings"
  case Explicit3DEffect = "Explicit 3D Effect"
  case AnimationStack = "Animation Stack"
  case Gestures = "Gestures"
  case ViewTransitions = "View Transitions"
  case ModifierTransitions = "Modifier Transitions"
}

@main
struct AnimationsApp: App {
  
  @State var selectedView: availableViews = .ModifierTransitions
  
  var body: some Scene {
    WindowGroup {
      VStack {
        VStack{
          Spacer()
          switch selectedView {
          case .Button: AnimatedButtons()
          case .Bindings: AnimatedBindings()
          case .Explicit3DEffect: ExplicitAnimations()
          case .AnimationStack: AnimationStack()
          case .Gestures: Gestures()
          case .ViewTransitions: ViewTransitions()
          case .ModifierTransitions: ModifierTransition()
          }
          Spacer()
        }
        
        Picker("Selected view", selection: $selectedView) {
          ForEach(availableViews.allCases, id: \.self) {
            Text("\($0.rawValue)")
          }
        }
        .background(.blue)
        .tint(.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(.bottom, 30)
      }
    }
  }
}
