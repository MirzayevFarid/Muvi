//
//  StarsRating.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//
import SwiftUI

struct StarsRating: View {
    var rating: CGFloat
    var maxRating: Int
    
    var body: some View {
        let rate = String(format: "%.1f", Double(rating))

        let stars = HStack(spacing: 2) {
            ForEach(0..<maxRating) { _ in
                Image(systemName: "star.fill")
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 12))
            }
            Text("\(rate)").font(.system(size: 12)).bold().foregroundColor(.black)
        }
        
        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}
