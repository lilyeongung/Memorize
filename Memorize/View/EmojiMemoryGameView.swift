//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andrew Park on 10/7/24.
//

import SwiftUI

let halloweenEmojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
let vehicleEmojis: Array<String> = ["🚗", "🏎️", "✈️", "🛵", "🚑", "🚁", "🛻", "🚢", "🛴", "🚂", "🚎", "🛺", "🚒", "🚲"]
let animalEmojis: Array<String> = ["🐈‍⬛", "🐕", "🐇", "🐀", "🦔", "🐍", "🐒", "🐉", "🐅"]

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    // Again, use @State for Demo purposes, later on how many cards there are will be determined by our Model in real code
    //    @State var cardCount: Int = 4
    @State var themeColor: Color = .red
    
    var body: some View {
        VStack {
            // Title
            Text("Memorize!")
                .font(.largeTitle)
            // Cards
            ScrollView {
                cards
            }
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
            
            Spacer()
            
            // Themes: At least 3 "Theme Choosing" Buttons
//            themes
            
            // Add/Remove cards
            //            cardCountAdjusters
            
        }
        .padding()
    }
    
    
    
    
    
    // MARK: - Themes
//    var themes: some View {
//        HStack(alignment: .lastTextBaseline, spacing: 45) {
//            emojisThemeAdjuster(for: "Vehicles", symbol: "car")
//                .foregroundStyle(.blue)
//            emojisThemeAdjuster(for: "Halloween", symbol: "theatermasks")
//                .foregroundStyle(.red)
//            emojisThemeAdjuster(for: "Animals", symbol: "pawprint")
//                .foregroundStyle(.green)
//        }
//    }
    
//    func emojisThemeAdjuster(for theme: String, symbol: String) -> some View {
//        Button(action: {
//            switch theme {
//            case "Vehicles":
//                emojis = vehicleEmojis.shuffled()
//                themeColor = .blue
//            case "Halloween":
//                emojis = halloweenEmojis.shuffled()
//                themeColor = .red
//            case "Animals":
//                emojis = animalEmojis.shuffled()
//                themeColor = .green
//            default:
//                emojis = emojis.shuffled()
//            }
//        }, label: {
//            VStack {
//                Image(systemName: symbol)
//                
//                Text(theme)
//                    .font(.caption)
//            }
//            .imageScale(.large)
//            .font(.title2)
//        })
//    }
    
    // MARK: - Cards
    // Implicit Return - one line of code: that creates an HStack and then modifies it. It doesn't matter that the argument to the HStack is a whole bunch of other code
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(themeColor)
    }
    
    
    
    
    
    //    var cardCountAdjusters: some View {
    //        HStack {
    //            cardRemover
    //            Spacer()
    //            cardAdder
    //        }
    //        .imageScale(.large)
    //        .font(.largeTitle)
    //        .padding(.top, 7)
    //    }
    //
    //    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
    //        Button(action: {
    //            // Safeguard our code so it doesn't go above or below our range
    //            cardCount += offset
    //        }, label: {
    //            Image(systemName: symbol)
    //        })
    //        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    //    }
    //
    //    var cardRemover: some View {
    //        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    //    }
    //    var cardAdder: some View {
    //        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    //    }
}


// MARK: - CardView (Foundation)
struct CardView: View {
    let card: MemoryGame<String>.Card
    
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
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}














#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
