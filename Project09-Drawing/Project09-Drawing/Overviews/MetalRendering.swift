//
//  MetalRendering.swift
//  Project09-Drawing
//
//  Created by Patt Martin on 8/29/22.
//

import SwiftUI

struct ColorCyclingCircle: View {
  var amount = 0.0
  var steps: Int = 100

  var body: some View {
    ZStack {
      ForEach(0 ..< steps, id: \.self) { value in
        Circle()
          .inset(by: Double(value))
          .strokeBorder(
            LinearGradient(gradient: Gradient(colors: [
              color(for: value, brightness: 1.0),
              color(for: value, brightness: 1.0),
              color(for: Int(Double(value) * 1.5), brightness: 1.0),
              color(for: value, brightness: 1.0),
              color(for: value, brightness: 1.0),
            ]), startPoint: .topLeading, endPoint: .bottomTrailing),
            lineWidth: 1.5)
      }
    }
    .drawingGroup()
  }

  func color(for value: Int, brightness: Double) -> Color {
    var targetHue = Double(value) / Double(steps) + amount
    if targetHue > 1 {
      targetHue -= 1
    }

    return Color(hue: targetHue, saturation: 1, brightness: brightness)
  }
}

struct MetalRendering: View {
  @State private var colorCycle = 0.0

  var body: some View {
    VStack {
      ColorCyclingCircle(amount: colorCycle)
        .frame(width: 300, height: 300)

      Slider(value: $colorCycle,in: 0...10)
        .padding([.horizontal])
    }
  }
}

struct MetalRendering_Previews: PreviewProvider {
  static var previews: some View {
    MetalRendering()
  }
}
