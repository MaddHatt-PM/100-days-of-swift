//
//  CreativeBordersAndFills.swift
//  Project09-Drawing
//
//  Created by Patt Martin on 8/29/22.
//

import SwiftUI

struct CreativeBordersAndFills: View {
  @State private var animationAmount = 40.0

  var body: some View {
    VStack {
      Text("Graphic Design\nis my passion")
        .font(Font.custom("Papyrus", size: 35))
        .foregroundColor(.secondary)
        .shadow(color: .green, radius: 3)
//        .foregroundColor(.white)
        .fontWeight(.thin)
        .multilineTextAlignment(.center)
        .frame(width: 400, height: 400)
        .border(ImagePaint(image: Image("bigrat"), sourceRect: CGRect(x: 1.0, y: 1.0, width: 0.8, height: 1), scale: 0.1), width: 80)
        .cornerRadius(50)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 30, y: 20, z: -60))
        .shadow(color: .blue, radius: 50)
        .onAppear {
          withAnimation(.interpolatingSpring(stiffness: 80.0, damping: 8.0).repeatForever(autoreverses: true).speed(1.25)) {
            animationAmount += 270
          }
        }
    }
  }
}

struct CreativeBordersAndFills_Previews: PreviewProvider {
  static var previews: some View {
    CreativeBordersAndFills()
  }
}
