//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andrew Park on 10/8/24.
//

import Foundation

struct MemoryGame<CardContent> {
    // Access control
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        // let's make this a Generic
        let content: CardContent
        
    }
    
}
