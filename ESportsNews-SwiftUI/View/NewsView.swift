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
            List(ViewModel.NewsList) { item in
                NavigationLink(destination: DetailView(data: item)) {
                    ListView(data: item)
                }.listRowInsets(EdgeInsets())
            }.task {
                await ViewModel.getNews()
            }.listStyle(.plain)
                .navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct NewsViewPreviews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
