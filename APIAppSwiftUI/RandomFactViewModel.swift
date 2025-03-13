//
//  RandomFactViewModel.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 3/12/25.
//

import Foundation
import SwiftUI

class RandomFactViewModel: ObservableObject {
    
    @Published var fact: String = ""
    
    init() {
        
    }
    @MainActor
    func loadRandomFact() async throws{
        let urlString = "https://uselessfacts.jsph.pl/api/v2/facts/random"
        if let url = URL(string: urlString) {
//            let (data, response) = try await URLSession.shared.data(from: url)
            let result = try await URLSession.shared.data(from: url)
            let data = result.0
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                print(json)
                
                fact = json["text"] as? String ?? "No fact found"
            }
            
        }
        
        
        
        
    }
}

