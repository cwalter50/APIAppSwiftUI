//
//  QuoteViewModel.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 3/13/25.
//

import SwiftUI

class QuoteViewModel: ObservableObject {
    
    @Published var quote: String = ""
    
    
    @MainActor
    func loadRandomQuote() async throws{
        let urlString = "https://www.quoterism.com/api/quotes/random"
        if let url = URL(string: urlString) {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                print(json)
                quote = json["text"] as? String ?? "No quote found"
            }
            
        }
    }
}
