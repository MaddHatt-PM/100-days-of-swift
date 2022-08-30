//
//  Shapes.swift
//  Project09-Drawing
//
//  Created by Patt Martin on 8/29/22.
//

import SwiftUI

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

    return path
  }
}

struct Arc: InsettableShape {
  let startAngle: Angle
  let endAngle: Angle
  let clockwise: Bool
  var insetAmount = 0.0

  func path(in rect: CGRect) -> Path {
    let rotationAdjustment = Angle.degrees(90)
    let modifiedStart = startAngle - rotationAdjustment
    let modifiedEnd = endAngle - rotationAdjustment
    var path = Path()

    path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

    return path
  }

  func inset(by amount: CGFloat) -> some InsettableShape {
    var arc = self
    arc.insetAmount += amount
    return arc
  }
}

struct Shapes: View {
  var body: some View {
    VStack {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      Triangle()
        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        .fill(.red)
        .frame(width: 300, height: 300)

      Arc(startAngle: .degrees(0), endAngle: .degrees(120), clockwise: true)
        .stroke(.blue, lineWidth: 10)
        .frame(width: 300, height: 300)
    }
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
