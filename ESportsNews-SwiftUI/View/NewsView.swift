//
//  ContentView.swift
//  ESportsNews-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    
    @ObservedObject var ViewModel = NewsViewModel()
    @State var search = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                TextField("Search", text: $search,onCommit: {
                    Task.init {
                        await ViewModel.getNews(category:search)
                    }
                })
                .padding()
                .textFieldStyle(.plain)
                .frame(height:40)
                .frame(maxWidth:.infinity)
                .background(.secondary)
                .cornerRadius(16)
                .padding()
                
                ForEach(ViewModel.NewsList) {item in
                    NavigationLink(destination: DetailView(data: item)) {
                        ListView(data: item)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
        }.task {
            await ViewModel.getNews(category: "")
        }
    }
}

struct NewsViewPreviews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
