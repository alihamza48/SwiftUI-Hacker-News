//
//  ContentView.swift
//  Hacker News
//
//  Created by admin on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) {post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
               
            }
            .navigationTitle("Hacker News")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}


//let posts = [
//Post(id: "1", title: "Hello"),
//Post(id: "2", title: "Helllllll"),
//Post(id: "3", title: "ppppp")
//]

#Preview {
    ContentView()
}
