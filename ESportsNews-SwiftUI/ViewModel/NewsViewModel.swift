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
    let baseUrl = URL(string: "http://kaanizgi.com/api/news")
    
    
    func getNews() async {
        do {
            let news = try await webService.fetchNews(url: baseUrl!)
            DispatchQueue.main.async {
                self.NewsList = news.data
                print(news)
            }
        } catch {
            print(error)
        }
    }
}
