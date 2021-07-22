//
//  Favorites.swift
//  Muvi
//
//  Created by Farid Mirzayev on 1.07.2021.
//

import SwiftUI

struct Discover: View {
    @State var showCard = true
    @State var viewState = CGSize.zero
    @State var show = true
    @ObservedObject var movieService = MovieService()
    
    var body: some View {
                VStack {
                    TopBar(movieService: self.movieService)
                    Cards(movieService: self.movieService)
                }
                .padding(.top, 10)
                .background(Color(.secondarySystemBackground))
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}

private struct Cards: View {
    @ObservedObject var movieService: MovieService
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing:20) {
                ForEach(movieService.movies) { movie in
                    NavigationLink(destination: FilmDetail(movie: movie)){
                        HStack{
                            FilmCard(movie: movie, width: 140, height: 180)
                                .frame(width: 140, height:180)
                                .shadow(color: Color(#colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 0.5)), radius: 10, x: 0, y: 15)
                                .padding(.trailing)
                            
                            
                            
                            VStack(alignment: .leading) {
                                Text(movie.title ?? "-").bold()
                                Spacer()
                                StarsRating(rating: Float(movie.voteAverage))
                                Spacer()
                                
                                Text(movieService.getGenreById(id: movie.genreId))
                                    .font(.system(size: 12))
                                    .padding()
                                    .frame(height: 25)
                                    .foregroundColor(Color("Gray2"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("Gray2"), lineWidth: 1)
                                    )
                                Spacer()
                                
                                HStack{
                                    Image(systemName: "clock.fill")
                                        .foregroundColor(Color("Gray2"))
                                    
                                    Text("1h 37m")
                                        .font(.system(size: 12))
                                        .bold()
                                }
                                Spacer()
                            }.padding(.vertical)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    if movie.id != movieService.movies.last?.id {
                        Divider()
                    }
                    else
                    {
                        Spacer().frame(height: 100)
                    }
                }
            }
            .padding(.horizontal)
            .ignoresSafeArea(.all)
        }.onAppear{
            movieService.getDiscover()
        }
    }
}


private struct TopBar: View {
    @ObservedObject var movieService: MovieService
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing:10) {
                Text("Discover")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                
                Text("Showing \(movieService.movies.count) different films")
                    .font(.system(size: 14))
                    .fontWeight(.light)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(movieService.genres) { genre in
                            CategoryButton(categoryName: genre.name ?? "-", isSelected: genre.id == 28 ? true : false)
                        }
                    }
                }
            }
            .frame(width: screen.width, height: 130, alignment: .leading)
            .padding()
        }
        .onAppear{
            movieService.getGenres()
            
        }
        .frame(width: screen.width, height: 150, alignment: .leading)
        .padding(.bottom)
    }
}

struct CategoryButton: View {
    var categoryName: String
    var isSelected: Bool
    var body: some View {
        Text(categoryName)
            .font(.system(size: 12))
            .padding()
            .frame(height: 35)
            .background(isSelected ? Color("Blue") : Color.white)
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(10)
    }
}
