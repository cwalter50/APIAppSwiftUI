//
//  DogView.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 3/13/25.
//

import SwiftUI

struct DogView: View {
    
    @StateObject var vm: DogViewModel = DogViewModel()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    try await vm.loadDogImage()
                }
                
            } label: {
                Text("Get Dog Image")
                    .font(.largeTitle)
            }
            
            Text("\(vm.dogURLString)")
            AsyncImage(url: URL(string: "\(vm.dogURLString)")) { image in
                image.resizable()
//                image.scaledToFit()
            } placeholder: {
                Image(systemName: "dog")
                    .resizable()
                
            }
            
            .frame(width: 300, height: 300)
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 25))
            

        }
        
    }
}

#Preview {
    DogView()
}
