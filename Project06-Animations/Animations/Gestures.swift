//
//  Gestures.swift
//  Animations
//
//  Created by Patt Martin on 8/11/22.
//

import SwiftUI

struct Gestures: View {
  @State private var dragAmount = CGSize.zero
  
  let letters = Array("Hello, SwiftUI")
  @State private var enabled = false
  @State private var textDragAmount = CGSize.zero
  
  var body: some View {
    VStack (spacing: 20) {
      Spacer()
      
      HStack(spacing: 0) {
        ForEach(0..<letters.count, id: \.self) { num in
          Text(String(letters[num]))
            .padding(2)
            .font(.title)
            .background(enabled ? .indigo : .cyan)
            .cornerRadius(textDragAmount.equalTo(CGSize.zero) ? 0 : 5)
            .offset(textDragAmount)
            .animation(
              .default.delay(Double(num) / 20),
              value: textDragAmount
            )
        }
      }
      .gesture(
        DragGesture()
          .onChanged { textDragAmount = $0.translation }
          .onEnded { _ in
            textDragAmount = .zero
            enabled.toggle()
          }
      )
      
      Spacer()
      
      LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .offset(dragAmount)
        .gesture(
          DragGesture()
            .onChanged { dragAmount = $0.translation }
            .onEnded { _ in dragAmount = .zero
              
            }
        )
        .animation(.spring(), value: dragAmount)
      
      Spacer()
    }
  }
}

struct Gestures_Previews: PreviewProvider {
  static var previews: some View {
    Gestures()
  }
}
