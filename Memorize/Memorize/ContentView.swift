//
//  ContentView.swift
//  Memorize
//
//  Created by Luke Sampson on 11/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true )
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.blue)
        .imageScale(.small)
        .padding()
    }
}

// MARK: Cards
struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("😎").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

#Preview {
    ContentView()
}
