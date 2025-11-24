//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Luke Sampson on 11/10/25.
//

import SwiftUI
import Combine

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["😎", "😝", "😉", "🤓", "🤣", "😏", "🤫", "🤠", "😴", "🤮", "🫨", "🥹"]
    
    // MARK: Create Memory Game
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .blue
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
