//
//  FilmDetail.swift
//  Muvi
//
//  Created by Mirzayev Farid on 15.07.2021.
//

import SwiftUI

struct FilmDetail: View {
    
    
    
    var body: some View {
        
        ZStack(alignment: .top){
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/mRfI3y2oAd7ejur2di09xC9niqp.jpg")!) {
                Rectangle().foregroundColor(Color.gray.opacity(0.4))
            } image: { (img) -> Image in
                Image(uiImage: img)
                    .resizable()
            }
            .aspectRatio(contentMode: .fill)
            .colorMultiply(.gray)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack(alignment: .topTrailing ) {
                    
                    FilmCard(movie: movieList[0], width: 200, height: 260, showTopBar: false)
                        .frame(width: 200, height:260)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 10)
                                    .blur(radius: 10)
                                    .foregroundColor(Color.gray)
                        )
                        .brightness(-0.1)
                    
                    Image("verified")
                        .offset(x: 30, y: 10)
                }
                
                Text(movieList[0].title ?? "-")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                HStack {
                    Text("Horror •")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                    Text("18+ •")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                    
                    Text("4.5")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                
                ZStack {
                    
                    HStack {
                        VStack {
                            Text("Length")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                            
                            Text("1.44m")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                        }
                        
                        
                        Divider()
                            .frame(width: 2, height: 40)
                            .background(Color.gray)
                            .padding()
                                                
                        VStack {
                            Text("Language")
                            
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                            Text("English")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                        }
                        
                        Divider()
                            .frame(width: 2, height: 40)
                            .background(Color.gray)
                            .padding()
                        
                        VStack {
                            Text("Review")
                                
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                            Text("+44 •")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                        }
                        
                        
                        
                    }
                    .padding()
                }
                .background(Blur(style: .systemUltraThinMaterialDark))
                .cornerRadius(10)
            }
        }
        
    }
}

struct FilmDetail_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetail()
    }
}
