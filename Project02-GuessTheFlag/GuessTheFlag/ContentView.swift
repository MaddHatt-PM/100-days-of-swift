//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Patt Martin on 8/9/22.
//

import SwiftUI

struct ContentView: View {
  @State private var showingRoundAlert = false
  @State private var showingFinalScoreAlert = false
  
  @State private var scoreTitle = ""
  @State private var score = 0
  @State private var rounds = 0
  
  private let MAX_ROUNDS = 8
  
  @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    .shuffled()
  @State var correctAnswer = Int.random(in: 0...2)
  
  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
      score += 1
    } else {
      scoreTitle = "Wrong\nThat's the flag of \(countries[number])"
    }
    rounds += 1
    if rounds == MAX_ROUNDS {
      showingFinalScoreAlert.toggle()
    } else {
      showingRoundAlert.toggle()
    }
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
  
  func restartGame() {
    score = 0
    rounds = 0
  }
  
  var body: some View {
    ZStack {
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
          .font(.largeTitle.bold())
          .foregroundColor(.white)
        
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
              } label: {
                Image(countries[number])
                  .renderingMode(.original)
                  .cornerRadius(5)
                  .shadow(radius: 10)
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