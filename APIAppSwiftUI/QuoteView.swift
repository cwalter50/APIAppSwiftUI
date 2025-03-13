//
//  QuoteView.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 3/13/25.
//

import SwiftUI

struct QuoteView: View {
    @StateObject var vm: QuoteViewModel = QuoteViewModel()
    var body: some View {
        VStack {
            Button {
                Task {
                    try await vm.loadRandomQuote()
                }
            } label: {
                Text("Get Random Quote")
            }
            
            Text(vm.quote)
        }
    }
}

#Preview {
    QuoteView()
}
