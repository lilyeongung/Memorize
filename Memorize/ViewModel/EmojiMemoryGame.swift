//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andrew Park on 10/8/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    // Make emojis global, but namespace it in my class
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    // Full separation
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    // Intent function
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}


