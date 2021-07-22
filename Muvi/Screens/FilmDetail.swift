//
//  FilmDetail.swift
//  Muvi
//
//  Created by Mirzayev Farid on 15.07.2021.
//

import SwiftUI

struct FilmDetail: View {
    @State var showModal = false
    @State var movie: Movie
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var showSeats: Bool = false


    var body: some View {
        ZStack(alignment: .center){
            Group{
                AsyncImage(url: URL(string: movie.posterPath)!) {
                    Rectangle().foregroundColor(Color.gray.opacity(0.4))
                } image: { (img) -> Image in
                    Image(uiImage: img)
                        .resizable()
                }
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .blur(radius: 4)
                .padding(-80)
                
                VStack {
                    Spacer()
                    Cover(movie: movie)
                    Text(movie.title!)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 15)
                    
                    Detail(movie: movie)
                        .padding(.top, 5)
                    About(movie: movie)
                        .padding(.top, 15)

                    Spacer()

                    LCButton(text: "Choose seats") {
                        self.showSeats.toggle()
                    }.sheet(isPresented: self.$showSeats) {
                        SeatsChoiceView(movie: self.movie, showSeats: $showSeats)
                    }.padding(.horizontal, 50)

                }
            }
//            BottomSheetView(isOpen: $showModal, maxHeight: screen.height - 90, title: "Mark Your Calendar") {
//                SeatsChoiceView(movie: movie)
//            }
//            .edgesIgnoringSafeArea(.all)

            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
                .font(.system(size: 24))
                .foregroundColor(Color("Blue"))
        })
    }
}


private struct Cover: View {
    let movie: Movie
    var body: some View {
        ZStack(alignment: .topTrailing ) {
            FilmCard(movie: movie, width: 200, height: 260, showTopBar: false)
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
    }
}

private struct Detail: View {
    let movie: Movie
    @ObservedObject var movieService = MovieService()
    
    var body: some View {
        HStack {
            Text("\(movieService.getGenreById(id: movie.genreId)) •")
                .font(.system(size: 18))
                .foregroundColor(.white)
            
            Text("\(movie.adult ?? false ? "18+" : "12+") •")
                .font(.system(size: 18))
                .foregroundColor(.white)
            
            Image(systemName: "star.fill")
                .foregroundColor(.white)
            
            Text(String(format: "%.1f", Double(movie.voteAverage)))
                .font(.system(size: 18))
                .foregroundColor(.white)
        }
    }
}

private struct About: View {
    let movie: Movie
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                VStack {
                    Text("Popularity")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    
                    Text(String(format: "%.f", Double(movie.popularity ?? 7)))
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
                
                
                Divider()
                    .frame(width: 2, height: 40)
                    .background(Color.gray)
                
                VStack {
                    Text("Language")
                        
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    Text(movie.original_language ?? "-")
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(width: 2, height: 40)
                    .background(Color.gray)
                
                VStack {
                    Text("Release Date")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    Text(movie.release_date ?? "-")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
            }
            .padding(20)
        }
        .background(Blur(style: .systemUltraThinMaterialDark))
        .cornerRadius(10)
    }
}



