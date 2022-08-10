//
//  CourseOverview.swift
//  WordScramble
//
//  Created by Patt Martin on 8/10/22.
//
// Things to know:
//  - Lists do not

import SwiftUI

struct ListOverview: View {
  let people = ["Finn", "Leia", "Luke", "Rey Starwars"]
  
  var body: some View {
    NavigationStack {
      List {
        Section("Section 1") {
          Text("Static row 1")
          Text("Static row 2")
        }
        
        Section("Section 2") {
          ForEach(0..<5) {
            Text("Dynamic row\($0)")
          }
        }
      }
      .listStyle(.grouped)
      Rectangle()
        .frame(height: 1)
      
      List (people, id: \.self) {
        Text("\($0)")
      }
      .navigationTitle("List Examples")
    }
  }
}

struct ListOverView_Previews: PreviewProvider {
  static var previews: some View {
    ListOverview()
  }
}



struct FileLoadingOverview: View {
  var body: some View {
    Text("Hello world")
  }
  
  func loadFile() {
    if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
      if let fileContents = try? String(contentsOf: fileURL) {
        print(fileContents)
      }
    }
  }
}


struct FileLoading_Previews: PreviewProvider {
  static var previews: some View {
    FileLoadingOverview()
  }
}



struct WorkingWithStrings: View {
  var body: some View {
    Text("Example")
  }
  
  func test() {
    let input = "a b c d\n entry"
    let letters = input.components(separatedBy: " ")
    // letters = ["a", "b", "c", "d\n", "entry]
    
    let rand = letters.randomElement() ?? "no chars"
    let trimmed = rand.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let word = "swift"
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    let allGood = misspelledRange.location == NSNotFound
  }
}

struct WorkingWithStrings_Previews: PreviewProvider {
  static var previews: some View {
    WorkingWithStrings()
  }
}
