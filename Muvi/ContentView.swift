//
//  ContentView.swift
//  Muvi
//
//  Created by Farid Mirzayev on 1.07.2021.
//

import SwiftUI

let filmList = [
    Film(rate: "7.2", image: #imageLiteral(resourceName: "Film1")),
    Film(rate: "7.3", image: #imageLiteral(resourceName: "make-your-movie-or-short-film-poster")),
    Film(rate: "7.3", image: #imageLiteral(resourceName: "pfilm2761-kontroll-movie-film-poster-high-resolution-image-1000x1000")),
    Film(rate: "7.2", image: #imageLiteral(resourceName: "Film1")),
    Film(rate: "7.3", image: #imageLiteral(resourceName: "make-your-movie-or-short-film-poster")),
    Film(rate: "7.3", image: #imageLiteral(resourceName: "pfilm2761-kontroll-movie-film-poster-high-resolution-image-1000x1000")),
]


struct ContentView: View {
    @State var showCard = true
    @State var viewState = CGSize.zero
    @State var show = true
    
    
    var body: some View {
        
        VStack {
            TopBar()
            Cards()
            Actors()
            BottomBar()
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Film: Identifiable {
    var id = UUID()
    var rate: String
    var image: UIImage
}

struct FilmCard: View {
    var film: Film
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(uiImage: film.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 260, alignment: .top)
            
            TopItems()
            
        }
        .frame(width: 200, height: 260)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct TopItems: View {
    var body: some View {
        
        HStack(alignment: .top){
            VStack {
                HStack{
                    Image(systemName: "star.fill").foregroundColor(.white)
                    Text("7.2")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .frame(width: 80, height: 42)
            .background(Blur(style: .systemUltraThinMaterialLight))
            .cornerRadius(30)
            
            Spacer()
            
            VStack {
                HStack{
                    Image(systemName: "heart").foregroundColor(.white)
                }
            }
            .frame(width: 40, height: 42)
            .background(Blur(style: .systemUltraThinMaterialLight))
            .cornerRadius(30)
        }.padding()
    }
}

struct TopBar: View {
    var body: some View {
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
        }.padding()
    }
}

struct Cards: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(filmList) { film in
                    GeometryReader { geometry in
                        FilmCard(film: film)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) - 50) / -getAngleMultiplier(), axis: (x: 0, y: 10, z: 0))
                        
                    }
                }
                .frame(width: 200, height: 280)
                .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
                            .opacity(0.1), radius: 0, x: 8, y:10)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct Actors: View {
    var body: some View {
        VStack {
            HStack(){
                Text("Popular Actor's")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                Spacer()
                Text("See All")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 5) { item in
                        VStack{
                            Image("p\(item)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 77, height: 77)
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                            Text("Lorem Ipsum").frame(width: 77, height: 55).lineLimit(2)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct BottomBar: View {
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                
                Image(systemName: "play.circle")
                    .frame(width: 30, height: 30)
                    .font(.system(size: 24))
                    .foregroundColor(Color("Primary"))
            }
            
            
            ZStack {
                Circle()
                    .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.968627451, alpha: 1)))
                    .frame(width: 50, height: 50)
                
                Image(systemName: "heart.fill")
                    .frame(width: 30, height: 30)
                    .font(.system(size: 24))
                    .foregroundColor(Color("Gray"))
            }
            
            ZStack {
                Circle()
                    .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.968627451, alpha: 1)))
                    .frame(width: 50, height: 50)
                
                Image(systemName: "bell.fill")
                    .frame(width: 30, height: 30)
                    .font(.system(size: 24))
                    .foregroundColor(Color("Gray"))
            }
            
            ZStack {
                Circle()
                    .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.968627451, alpha: 1)))
                    .frame(width: 50, height: 50)
                
                Image(systemName: "person.fill")
                    .frame(width: 30, height: 30)
                    .font(.system(size: 24))
                    .foregroundColor(Color("Gray"))
            }
            
        }
        .frame(width: screen.maxX - 100, height: 60, alignment: .center)
        .background(Color(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.968627451, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
