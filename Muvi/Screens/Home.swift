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
    
    var body: some View {
        
        VStack {
            TopBar()
            Cards()
            ActorCard()
            BottomBar()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
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
