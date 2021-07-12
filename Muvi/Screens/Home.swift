//
//  ContentView.swift
//  Muvi
//
//  Created by Farid Mirzayev on 1.07.2021.
//

import SwiftUI



struct Home: View {
    @State var showCard = true
    @State var viewState = CGSize.zero
    @State var show = true
    @State private var searchTerm = ""
    @State private var tabs = ["Now Playing", "Upcoming", "Trending"]
    @ObservedObject var movieService = MovieService()
    @State private var selectionIndex = 0
    
    var body: some View {
        
        
        ZStack {
            VStack {
                TopBar( tabs: $tabs, movieService: self.movieService, selectionIndex: $selectionIndex)
                Cards(searchTerm: $searchTerm, movieService: self.movieService)
                ActorCard(movieService: self.movieService)
                Spacer()
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


private struct TopBar: View {
    
    @Binding var tabs: Array<String>
    @ObservedObject var movieService: MovieService
    @Binding var selectionIndex: Int
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing:10) {
                HStack {
                    Image(systemName: "film")
                        .foregroundColor(.gray)
                    Text("MOVIES")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("What would you like to see today?")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .frame(maxWidth: screen.maxX - 100)
                        .lineLimit(3)
                    Spacer()
                    Image(systemName: "magnifyingglass").font(.system(size: 24))
                    
                }
                VStack {
                    Picker("_", selection: $selectionIndex) {
                        ForEach(0..<tabs.count) { index in
                            Text(tabs[index])
                                .font(.title)
                                .bold()
                                .tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selectionIndex) { (_) in
                        if selectionIndex == 0 {
                            movieService.getNowPlaying()
                        } else if selectionIndex == 1 {
                            movieService.getUpcoming()
                        } else if selectionIndex == 2 {
                            movieService.getPopular()
                        }
                    }
                }.padding()
            }.padding()
        }
    }
}



private struct Cards: View {
    @Binding var searchTerm: String
    @ObservedObject var movieService: MovieService
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(movieService.movies.filter {
                            searchTerm.isEmpty ? true :
                                $0.title?.lowercased().localizedStandardContains(searchTerm.lowercased()) ?? true }) { movie in
                    GeometryReader { geometry in
                        FilmCard(movie: movie)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) - 50) / -getAngleMultiplier(), axis: (x: 0, y: 10, z: 0))
                        
                    }
                }
                .frame(width: 200, height: 280)
                .animation(.easeInOut(duration: 0.5))
                .transition(.opacity)
                .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
                            .opacity(0.1), radius: 0, x: 7, y:7)
            }.onAppear {
                movieService.getNowPlaying()
            }
            .padding(.horizontal)
        }
    }
}
