//
//  NetworkManager.swift
//  Hacker News
//
//  Created by admin on 7/9/24.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    @Published var isFetchComplete = false
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async{
                                self.posts = results.hits
                                self.isFetchComplete = true
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.isFetchComplete = true // Set the boolean to true even if there is an error
                    }
                }
            }
            task.resume()
        }
    }
}
//
//  NetworkManager.swift
//  Hacker News
//
//  Created by admin on 7/9/24.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    @Published var isFetchComplete = false
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async{
                                self.posts = results.hits
                                self.isFetchComplete = true
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.isFetchComplete = true // Set the boolean to true even if there is an error
                    }
                }
            }
            task.resume()
        }
    }
}
