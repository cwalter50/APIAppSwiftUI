//
//  DogViewModel.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 3/13/25.
//

import SwiftUI

class DogViewModel: ObservableObject {
    
    @Published var dogURLString: String = ""
    
    @MainActor
    func loadDogImage() async throws{
        let urlString = "https://dog.ceo/api/breeds/image/random"
        if let url = URL(string: urlString) {
            let (data, response) = try await URLSession.shared.data(from: url)
//            let result = try await URLSession.shared.data(from: url)
//            let data = result.0
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                print(response.url)
                print(json)
                
                
                dogURLString = json["message"] as? String ?? "No fact found"
            }
            
        }
    }
}
