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
                ForEach(ViewModel.NewsList) {item in
                    NavigationLink(destination: DetailView(data: item)) {
                        ListView(data: item)
                    }.buttonStyle(PlainButtonStyle())
                }
                .searchable(text: $search,prompt:"Search Category")
                .disableAutocorrection(true)
                .onChange(of: search) { searchText in
                        Task.init {
                            await ViewModel.getNews(category:searchText)
                        }
                    }
            }.navigationTitle("News")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NewsViewPreviews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
