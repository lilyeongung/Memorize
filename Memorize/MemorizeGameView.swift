//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Andrew Park on 10/7/24.
//

import SwiftUI

struct MemorizeGameView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    // Again, use @State for Demo purposes, later on how many cards there are will be determined by our Model in real code
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
                
        }
        .padding()
        
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    // Implicit Return - one line of code: that creates an HStack and then modifies it. It doesn't matter that the argument to the HStack is a whole bunch of other code
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.red)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            // Safeguard our code so it doesn't go above or below our range
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

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
