//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Luke Sampson on 11/3/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    let emojis: [String] = ["😎", "😝", "😉", "🤓", "🤣", "😏", "🤫", "🤠", "😴", "🤮", "🫨", "🥹"]
    
    var body: some View {
        VStack{
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    // MARK: Cards
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.blue)
    }
}

// MARK: CardView
struct CardView: View {
    var card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

// MARK: Preview
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
