//
//  WebService.swift
//  ESportsNews-SwiftUI
//
//  Created by Kaan İzgi on 30.03.2022.
//

import Foundation


class WebService {
    
    func fetchNews(url:URL) async throws -> NewsCevap {
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let newsData = try? JSONDecoder().decode(NewsCevap.self, from: data)
        return newsData!
    }
}
