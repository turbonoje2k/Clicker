//
//  ContentView.swift
//  Clicker
//
//  Created by noje on 03/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var bestScore = 0
    @State var gameIsInProgress = false
    
    var body: some View {
        VStack {
            HStack {
                if score >= bestScore && score != 0 {
                    Image(systemName: "flame")
                }
                Text("Score : \(score)")
                    .padding()
            }.font(.title)
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .padding()
                    .font(.title)
                    .onTapGesture {
                        score += 1
                    }
            }
            Spacer()
            if gameIsInProgress == false {
                Button("New Game") {
                    score = 0
                    gameIsInProgress = true
                    Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
                        gameIsInProgress = false
                        if score > bestScore {
                            bestScore = score
                        }
                    }
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
