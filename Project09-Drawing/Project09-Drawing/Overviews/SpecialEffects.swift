//
//  SpecialEffects.swift
//  Project09-Drawing
//
//  Created by Patt Martin on 8/29/22.
//

import SwiftUI

struct SpecialEffects: View {
  @State var amount = 0.25

  var body: some View {
    ZStack {
      Image("bigrat")
        .resizable()
        .ignoresSafeArea()

      Rectangle()
        .fill(LinearGradient(
          gradient: Gradient(colors: [.blue, .red, .green]),
          startPoint: .topLeading, endPoint: .bottomTrailing))
        .blendMode(.overlay)
        .ignoresSafeArea()

      Circle()
        .fill(.red)
        .frame(width: 300 * amount)
        .offset(x: -50, y: -80)
        .blendMode(.screen)

      Circle()
        .fill(.green)
        .frame(width: 300 * amount)
        .offset(x: 50, y: -80)
        .blendMode(.screen)
      
      Circle()
        .fill(.blue)
        .frame(width: 300 * amount)
        .blendMode(.screen)
      
      Slider(value: $amount)
        .offset(x: 0, y: 300)
        .padding(.horizontal)
    }
  }
}

struct SpecialEffects_Previews: PreviewProvider {
  static var previews: some View {
    SpecialEffects()
  }
}
