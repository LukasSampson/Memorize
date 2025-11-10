//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Luke Sampson on 11/10/25.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    var score: Int
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
