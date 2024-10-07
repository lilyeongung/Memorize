//
//  ContentView.swift
//  Memorize
//
//  Created by Andrew Park on 10/7/24.
//

import SwiftUI

// Behaves like a... View- a Rectangular area on screen that draws something and can get Events.
struct ContentView: View {
    // Computed property- value of this variable is computed, everytime someone asks for the value of the body it runs this code
    // Read-only
    var body: some View {
        // Embedded Functions- functions passed as arguments all the time
        // VStack is a TupleView and is taking one argument "content:" which is a function that returns a bag-of-legos View that it can arrange
        // In our bag-of-lego views we can list views, we can have conditionals, if thens, and we can declare local variables
        // We cannot do math- logic
        // ViewBuilder is turning our list of views into a TupleView
        VStack(content: {
            Image(systemName: "globe")
            // View Modifiers are functions, you call it on a View, it modifies the View in some way, and returns a new modified View
                .imageScale(.large)
                .foregroundStyle(.green)
            Text("Hello, CS193p!")
        })
        .padding()
        
        
    }
}
















#Preview {
    ContentView()
}
