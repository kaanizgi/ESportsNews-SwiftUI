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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(ViewModel.NewsList) {item in
                    NavigationLink(destination: DetailView(data: item)) {
                        ListView(data: item)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
        }.task {
            await ViewModel.getNews()
        }
    }
}

struct NewsViewPreviews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
