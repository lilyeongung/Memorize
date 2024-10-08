//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Andrew Park on 10/7/24.
//

import SwiftUI

let halloweenEmojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
let vehicleEmojis: Array<String> = ["🚗", "🏎️", "✈️", "🛵", "🚑", "🚁", "🛻", "🚢", "🛴", "🚂", "🚎", "🛺", "🚒", "🚲"]
let animalEmojis: Array<String> = ["🐈‍⬛", "🐕", "🐇", "🐀", "🦔", "🐍", "🐒", "🐉", "🐅"]

struct MemorizeGameView: View {
    // Again, use @State for Demo purposes, later on how many cards there are will be determined by our Model in real code
//    @State var cardCount: Int = 4
    @State var emojis: Array<String> = halloweenEmojis
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
            Spacer()
            
            // Themes: At least 3 "Theme Choosing" Buttons
            themes
            
            // Add/Remove cards
//            cardCountAdjusters
            
        }
        .padding()
    }
    
    
    // MARK: - Themes
    var themes: some View {
        HStack(alignment: .lastTextBaseline, spacing: 45) {
            emojisThemeAdjuster(for: "Vehicles", symbol: "car")
            emojisThemeAdjuster(for: "Halloween", symbol: "theatermasks")
            emojisThemeAdjuster(for: "Animals", symbol: "pawprint")
        }
    }
    
    func emojisThemeAdjuster(for theme: String, symbol: String) -> some View {
        Button(action: {
            switch theme {
            case "Vehicles":
                emojis = vehicleEmojis.shuffled()
                themeColor = .blue
            case "Halloween":
                emojis = halloweenEmojis.shuffled()
                themeColor = .red
            case "Animals":
                emojis = animalEmojis.shuffled()
                themeColor = .green
            default:
                emojis = emojis.shuffled()
            }
        }, label: {
            VStack {
                Image(systemName: symbol)
                
                Text(theme)
                    .font(.caption)
            }
            .imageScale(.large)
            .font(.title2)
            
        })
    }
    
    // MARK: - Cards
    // Implicit Return - one line of code: that creates an HStack and then modifies it. It doesn't matter that the argument to the HStack is a whole bunch of other code
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            let randomPair = Int.random(in: 2...emojis.count)
            ForEach(0..<randomPair, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
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
    let content: String
    // @State creates a pointer to isFaceUp, we're going to replace this later in our Game Logic files
    @State var isFaceUp = true
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
                
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        // Views are immutable
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}














#Preview {
    MemorizeGameView()
}
