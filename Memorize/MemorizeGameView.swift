//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Andrew Park on 10/7/24.
//

import SwiftUI

struct MemorizeGameView: View {
    var body: some View {
        
        HStack {
            CardView()
            
            CardView()
            
            CardView()
            
            CardView()
        }
        .foregroundStyle(.red)
        .padding()
        
    }
}

struct CardView: View {
    // @State creates a pointer to isFaceUp
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text("👻").font(.largeTitle)
                
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
