//
//  ContentView.swift
//  ChuckNorrisJokes
//
//  Created by Marcela Hernandez on 16/9/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var data = Jokes(id: "id number", value: "Joke", icon: "iconURL")
    
    struct Jokes: Decodable, Identifiable {
        let id: String
        let value: String
        let icon: String
        
        
        enum CodingKeys: String, CodingKey {
            case id
            case value
            case icon = "icon_url"
        }
    }
    
    func fetchJokes () {
        let urlString = "https://api.chucknorris.io/jokes/random"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Jokes.self, from: data)
                        self.data = decodedData
                    } catch {
                        print(error)
                    }
                }
            }
        } . resume()
    }
    
    func getNewJoke () {
        if data.value == data.value {
            fetchJokes()
        }
    }
    
    var body: some View {
        VStack {
            Text("Chuck Norris Jokes")
                .fontWeight(.bold)
                .font(.system(size: 30))
            Spacer()
        }
        VStack(alignment: .center) {
            Text("The joke: ")
            Text ("\(data.value)")
                .padding()
            Spacer()
        }
        
        VStack {
            Button("Get New Joke") {
                self.fetchJokes()
                self.getNewJoke()
            }
        }
        
    }
        
    
}

#Preview {
    ContentView()
}

