//
//  JeopardyView.swift
//  APIAppSwiftUI
//
//  Created by Christopher Walter on 2/9/23.
//

import SwiftUI

struct JeopardyView: View {
    
    @State var showAnswer = false
    
    @State var question = ""
    @State var answer = ""
    
    var body: some View {
        VStack {
            Button("Get Question")
            {
                loadJeopardyQuestion()
            }
            Text(question)
                .padding()
            
            
            
            Button("Show Answer")
            {
                showAnswer.toggle()
            }
            if showAnswer == true {
                Text(answer)
            }
            
                
        }
        .font(.largeTitle)
        
    }
    
    
    func loadJeopardyQuestion()
    {
        showAnswer = false
        let urlString = "http://jservice.io/api/random"
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
//            request.addValue("application/json", forHTTPHeaderField: "Accept")
//            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                if let err = error {
                    print(err)
                    return
                }
                
                do {
                    guard let data = data else {return}
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]]
                    if let jsonData = json {
                        let dictionary = jsonData[0]
                        self.question = dictionary["question"] as? String ?? "clue error"
                        self.answer = dictionary["answer"] as? String ?? "answer error"

                        print(jsonData)
                    }
                } catch let jsonError {
                    print(jsonError)
                }
            }
            
            task.resume()
        }
    }
    
}

struct JeopardyView_Previews: PreviewProvider {
    static var previews: some View {
        JeopardyView()
    }
}
