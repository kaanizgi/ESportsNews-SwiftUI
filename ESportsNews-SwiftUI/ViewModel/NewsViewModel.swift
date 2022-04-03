//
//  NewsViewModel.swift
//  ESportsNews-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import Foundation

class NewsViewModel:ObservableObject {
    
    
    @Published var NewsList = [News]()
    let webService = WebService()
    
    init() {
        Task.init {
                await getNews(category: "")
        }
    }
    
    func getNews(category:String) async {
        do {
            let news = try await webService.fetchNews(url: (URL(string: "https://www.kaanizgi.com/api/news?category_search=\(category)")!))
            DispatchQueue.main.async {
                self.NewsList = news.data
            }
        } catch {
            print(error)
        }
    }
}
