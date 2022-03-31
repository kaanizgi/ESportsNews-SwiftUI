//
//  DetailView.swift
//  ESportsNews-SwiftUI
//
//  Created by Kaan İzgi on 31.03.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    var data:News
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            DetailListView(data: data)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let datam = News(id: 1, title: "", detail: "", image_url: "", writer: "", team: "", created_at: "", category_name: "")
        DetailView(data: datam)
    }
}
