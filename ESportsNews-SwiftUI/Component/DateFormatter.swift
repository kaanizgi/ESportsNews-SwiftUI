//
//  DateFormatter.swift
//  ESportsNews-SwiftUI
//
//  Created by Kaan İzgi on 31.03.2022.
//

import Foundation



extension String {
  func convertToDate() -> String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
      if let dt = dateFormatter.date(from: self) {
          dateFormatter.dateFormat = "MM-dd-yy"
          let formatedStringDate = dateFormatter.string(from: dt)
              return formatedStringDate
      }
      return "01-01-70"
  }
}
