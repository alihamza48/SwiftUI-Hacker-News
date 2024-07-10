//
//  ContentView.swift
//  Hacker News
//
//  Created by admin on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            if networkManager.isFetchComplete{
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
            else{
                ZStack{
                    Color(.systemBackground)
                        .ignoresSafeArea()
                        .opacity(0.8)
                    
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(3)
                }
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 900)
                .opacity(0.8)
            }
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
//            startNetworkCall()
        })
        
//        {
//            ZStack{
//                Color(.systemBackground)
//                    .ignoresSafeArea()
//                    .opacity(0.8)
//                
//                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .black))
//                    .scaleEffect(3)
//            }
//            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 900)
//            .opacity(0.8)
//        }
    }
    
//        func startNetworkCall(){
//            isLoading = true
//            if self.networkManager.fetchData() != nil {
//                isLoading = false
//            }
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//
//            }
           
        }
}


#Preview {
    ContentView()
}



