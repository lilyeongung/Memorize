//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Andrew Park on 10/7/24.
//

import SwiftUI

struct MemorizeGameView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "😈"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.red)
        .padding()
        
    }
}

struct CardView: View {
    let content: String
    // @State creates a pointer to isFaceUp, we're going to replace this later in our Game Logic files
    @State var isFaceUp = true
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text(content).font(.largeTitle)
                
            } else {
                base.fill()
    
            }
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
