//
//  RandomFactView.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 3/12/25.
//

import Foundation
import SwiftUI

struct RandomFactView: View {
    @StateObject var vm = RandomFactViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.fact)")
            Button {
                Task {
                    do {
                        try await vm.loadRandomFact()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Get Random Fact")
            }
        }
    }
}

#Preview {
    RandomFactView()
}
