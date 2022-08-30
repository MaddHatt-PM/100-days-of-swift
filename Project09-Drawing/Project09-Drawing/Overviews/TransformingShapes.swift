//
//  TransformingShapes.swift
//  Project09-Drawing
//
//  Created by Patt Martin on 8/29/22.
//

import SwiftUI

struct Flower: Shape {
  var petalCount = 8
  var petalOffset = -20.0
  var petalWidth = 100.0

  func path(in rect: CGRect) -> Path {
    var path = Path()

    for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / Double(petalCount)) {
      let rotation = CGAffineTransform(rotationAngle: number)
      let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

      let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
      let rotatedPetal = originalPetal.applying(position)
      path.addPath(rotatedPetal)
    }

    return path
  }
}

struct TransformingShapes: View {
  @State private var petalOffset = -20.0
  @State private var petalWidth = 100.0

  var body: some View {
    VStack {
      ZStack {
        Flower(petalCount: 16, petalOffset: petalOffset, petalWidth: petalWidth)
          .fill(.red, style:FillStyle(eoFill: true, antialiased: true))
//        Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//          .stroke(.red, lineWidth: 2)
      }

      Text("Offset")
      Slider(value: $petalOffset, in: -180...180)
        .padding([.horizontal, .bottom])

      Text("Width")
      Slider(value: $petalWidth, in: 0...500)
        .padding([.horizontal, .bottom])
    }
  }
}

struct TransformingShapes_Previews: PreviewProvider {
  static var previews: some View {
    TransformingShapes()
  }
}
