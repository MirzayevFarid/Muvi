//
//  StarsRating.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//

import SwiftUI

struct StarsRating: View {
  private static let MAX_RATING: Float = 5
    private static let COLOR = Color.yellow

  let rating: Float
  private let fullCount: Int
  private let emptyCount: Int
  private let halfFullCount: Int

  init(rating: Float) {
    self.rating = rating
    fullCount = Int(rating)
    emptyCount = Int(StarsRating.MAX_RATING - rating)
    halfFullCount = (Float(fullCount + emptyCount) < StarsRating.MAX_RATING) ? 1 : 0
  }

  var body: some View {
    HStack(spacing: 5) {
      ForEach(0..<fullCount) { _ in
         self.fullStar
       }
       ForEach(0..<halfFullCount) { _ in
         self.halfFullStar
       }
       ForEach(0..<emptyCount) { _ in
         self.emptyStar
       }
     }
  }

  private var fullStar: some View {
    Image(systemName: "star.fill")
        .foregroundColor(StarsRating.COLOR)
        .font(.system(size: 14))
  }

  private var halfFullStar: some View {
    Image(systemName: "star.lefthalf.fill")
        .foregroundColor(StarsRating.COLOR)
        .font(.system(size: 14))
  }

  private var emptyStar: some View {
    Image(systemName: "star")
        .foregroundColor(StarsRating.COLOR)
        .font(.system(size: 14))
  }
}
