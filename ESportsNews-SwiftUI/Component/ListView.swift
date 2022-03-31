//
//  ListView.swift
//  ESportsNews-SwiftUI
//
//  Created by Kaan İzgi on 31.03.2022.
//

import SwiftUI
import SDWebImageSwiftUI



struct ListView: View {
    
    var data:News
    var body: some View {
        VStack(alignment:.leading) {
            WebImage(url: URL(string: data.image_url ?? ""))
                .resizable()
                .frame(height: 200)
                .frame(maxWidth:.infinity)
            Text(data.title)
                .font(.body)
                .bold()
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding(.horizontal)
            
            Text(data.detail)
                .font(.callout)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .lineLimit(2)
                .padding(.vertical,1)
            HStack {
                Text(data.dateFormat,format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                Text(data.category_name)
                    .font(.footnote)
                    .foregroundColor(.red)
            }.padding(.horizontal)
                .padding(.bottom)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let datam = News(id: 1, title: "Astralis'ten uzun yıllar sonra takımda değişiklik!", detail: "Dün tamamlanan challangers aşamasından sonra takımların netleştiği PGL Major Stockholm 2021'de Türkiye saatiyle 11:00'da Legends aşaması bugün başlıyor.\r\n\r\nBO1 üzerinden oynanacak olan ilk maçlar swiss formatı üzerinden devam edicek.NAVI,Vitality gibi üst seviye takımların bulunduğu ve CS:GO seviyesinde gerçekleşen en büyük organizasyon olarak kabul edilen Major önümüzdeki günlerde büyük heyecana sahne olacak. ", image_url: "https://pbs.twimg.com/media/FDVzajCXIAoOHmA?format=jpg&name=small", writer: "", team: "", created_at: "2021-11-01T13:41:04.000000Z", category_name: "CS:GO")
        ListView(data: datam)
    }
}
