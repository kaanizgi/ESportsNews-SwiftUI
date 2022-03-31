//
//  news.swift
//  e-spor
//
//  Created by Kaan İzgi on 21.10.2021.
//

import Foundation


struct NewsCevap: Decodable {
    var data: [News]
}


struct News: Decodable,Identifiable {
    var id: Int
    var title:String
    var detail: String
    var image_url: String?
    var writer:String
    var team:String
    var created_at:String
    var category_name: String
}



