//
//  DetailListView.swift
//  ESportsNews-SwiftUI
//
//  Created by Kaan İzgi on 31.03.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailListView: View {
    var data:News
    var body: some View {
        VStack(alignment:.leading) {
            WebImage(url: URL(string: data.image_url ?? ""))
                .resizable().frame(height: 300).frame(maxWidth:.infinity)
            HStack {
                Image(systemName: "pencil.circle.fill")
                    .font(.title3)
                Text(data.writer)
                    .font(.body)
                    .bold()
                    .foregroundColor(.red)
                Spacer()
                Text(data.dateFormat,format: .dateTime.year().month().day())
                    .font(.footnote)
                    .opacity(0.7)
            }
            .padding(.horizontal)
            .padding(.vertical,5)
            .padding(.bottom,5)
            Text(data.title)
                .bold()
                .font(.title2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            Text(data.detail)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .padding(.vertical,4)
                
            Spacer()
        }
    }
}

struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
        var datam = News(id: 1, title: "Astralis'ten uzun yıllar sonra takımda değişiklik!", detail: "Dün tamamlanan challangers aşamasından sonra takımların netleştiği PGL Major Stockholm 2021'de Türkiye saatiyle 11:00'da Legends aşaması bugün başlıyor.\r\n\r\nBO1 üzerinden oynanacak olan ilk maçlar swiss formatı üzerinden devam edicek.NAVI,Vitality gibi üst seviye takımların bulunduğu ve CS:GO seviyesinde gerçekleşen en büyük organizasyon olarak kabul edilen Major önümüzdeki günlerde büyük heyecana sahne olacak. ", image_url: "https://pbs.twimg.com/media/FDVzajCXIAoOHmA?format=jpg&name=small", writer: "Kaan İzgi", team: "", created_at: "2021-11-01T13:41:04.000000Z", category_name: "CS:GO")
        DetailListView(data: datam)
    }
}
