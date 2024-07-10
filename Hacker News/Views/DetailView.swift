//
//  DetailView.swift
//  Hacker News
//
//  Created by admin on 7/9/24.
//

import SwiftUI


struct DetailView: View {
    
    let url: String?
    @State var isLoading = false
    
    var body: some View {
        WebView(urlString: url)
            .onAppear(perform: {
            startNetworkCall()
        })
        
        if isLoading{
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
    
    
    func startNetworkCall(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            isLoading = false
        }
    }
}


#Preview {
    DetailView(url: "https://www.google.com")
}




