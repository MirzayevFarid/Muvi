//
//  FilmCard.swift
//  Muvi
//
//  Created by Farid Mirzayev on 5.07.2021.
//

import SwiftUI

struct FilmCard: View {
    var movie: Movie
    var width: CGFloat = 200
    var height: CGFloat = 260
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: movie.posterPath)!) {
                        Rectangle().foregroundColor(Color.gray.opacity(0.4))
                    } image: { (img) -> Image in
                        Image(uiImage: img)
                            .resizable()
                    }
            
            CardTopBar(width: self.width, height: self.height)
            
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .scaledToFill()
    }
}

struct CardTopBar: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        
        let rankSize = 16 * width / 200
        let rankFrameW = 80 * width / 200
        let rankFrameH = 42 * height / 260
        
        
        let heartSize = 16 * width / 200
        let heartFrameW = 40 * width / 200
        let heartFrameH = 42 * height / 260
        
        HStack(alignment: .top){
            VStack {
                HStack(alignment: .lastTextBaseline){
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                        .font(.system(size: rankSize))
                    Text("7.2")
                        .font(.system(size: rankSize))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .frame(width: rankFrameW, height: rankFrameH)
            .background(Blur(style: .systemUltraThinMaterialLight))
            .cornerRadius(30)
            
            Spacer()
            
            VStack {
                HStack{
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                        .font(.system(size: heartSize))
                }
            }
            .frame(width: heartFrameW, height: heartFrameH)
            .background(Blur(style: .systemUltraThinMaterialLight))
            .cornerRadius(30)
        }.padding()
    }
}
