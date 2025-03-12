//
//  ContentView.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 2/9/23.
//

import SwiftUI

struct ContentView: View {
    

    
    var body: some View {
        TabView {
            JokeView()
                .tabItem {
                    Label("Joke", systemImage: "list.dash")
                }

            JeopardyView()
                .tabItem {
                    Label("Jeopardy", systemImage: "square.and.pencil")
                }
            RandomFactView()
                .tabItem {
                    Label("Random Fact", systemImage: "book")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
