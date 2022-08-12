//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Patt Martin on 8/9/22.
//

import SwiftUI

extension View {
  @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}

struct FlagImage: ViewModifier {
  func body(content: Content) -> some View {
    content
      .cornerRadius(5)
      .shadow(radius: 10)
  }
}

struct TitleStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle.bold())
      .foregroundColor(.white)
  }
}

extension View {
  func titleStyle() -> some View {
    modifier(TitleStyle())
  }
}

struct ContentView: View {
  @State private var showingRoundAlert = false
  @State private var showingFinalScoreAlert = false
  
  @State private var scoreTitle = ""
  @State private var score = 0
  @State private var rounds = 0
  
  private let MAX_ROUNDS = 8
  
  @State var countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US"
  ].shuffled()
  @State var correctAnswer = Int.random(in: 0...2)
  @State var isWaitingForAnimation = false
  @State var animAmount = 0.0
  var animTime = 0.8
  
  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
      score += 1
    } else {
      scoreTitle = "Wrong\nThat's the flag of \(countries[number])"
    }
    
    if isWaitingForAnimation == false {
      isWaitingForAnimation = true
      DispatchQueue.main.asyncAfter(deadline: .now() + animTime) {
        isWaitingForAnimation = false
        rounds += 1
        if rounds == MAX_ROUNDS {
          showingFinalScoreAlert.toggle()
        } else {
          showingRoundAlert.toggle()
        }
      }
    }
  }
    
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    animAmount = 0.0
  }
  
  func restartGame() {
    score = 0
    rounds = 0
  }
  
  func lerp(start: Double, end: Double, value: Double ) -> Double {
    return start + (end - start) * value
  }
  
  var body: some View {
    
    return ZStack {
      Color.cyan
        .ignoresSafeArea()
      
      VStack {
        Circle()
          .fill(.blue)
          .frame(width: 700, height:700)
          .padding(.top, -350)
        
        Spacer()
      }
      
      VStack {
        Spacer()
        
        Text("Guess the Flag")
          .titleStyle()
        
        Spacer()
        
        VStack (spacing: 15){
          VStack {
            Text("Tap the flag of")
              .foregroundColor(.white)
              .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])
              .foregroundStyle(.secondary)
              .font(.largeTitle.weight(.semibold))
          }
          
          VStack (spacing: 30){
            ForEach(0..<3) { number in
              Button {
                flagTapped(number)
                withAnimation (.easeOut(duration: animTime)) {
                  animAmount = 1.0
                }
              } label: {
                Image(countries[number])
                  .modifier(FlagImage())
                  .if(number == correctAnswer) { view in
                    view
                      .rotation3DEffect(
                        .degrees(animAmount * 360),
                        axis: (x: 0, y: 1, z: 0),
                        perspective: 0.6
                      )
                  }
                  .if(number != correctAnswer) { view in
                    view
                      .opacity(lerp(start: 1.0, end: 0.25, value: animAmount))
                      .scaleEffect(lerp(start: 1.0, end: 0.75, value: animAmount))
                  }
              }
            }
          }
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width - 30)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
        Spacer()
        Text("Round: \(rounds)/\(MAX_ROUNDS)\nScore: \(score)")
          .font(.title2)
          .foregroundColor(.white)
          .lineSpacing(8)
          .multilineTextAlignment(.center)
        
        Spacer()
      }
    }
    .alert(scoreTitle, isPresented: $showingRoundAlert) {
      Button("Continue", action: askQuestion)
    } message: {
      Text("Your score is \(score)")
    }
    .alert("Game over!", isPresented: $showingFinalScoreAlert) {
      Button("Play again", action: restartGame)
    } message: {
      Text("You got a score of \(score) of \(MAX_ROUNDS)")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
