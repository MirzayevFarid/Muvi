//
//  ActorCard.swift
//  Muvi
//
//  Created by Farid Mirzayev on 5.07.2021.
//

import SwiftUI

struct ActorCard: View {
    @ObservedObject var movieService: MovieService

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
                    .foregroundColor(Color("Blue"))
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movieService.actors) { actor in
                        VStack{
                            AsyncImage(url: URL(string: actor.profilePhoto)!) {
                                        Rectangle().foregroundColor(Color.gray.opacity(0.4))
                                    } image: { (img) -> Image in
                                        Image(uiImage: img)
                                            .resizable()
                                    }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 77, height: 77)
                                .clipShape(Rectangle())
                                .cornerRadius(10)
                            Text(actor.name ?? "-").frame(width: 77, height: 55).lineLimit(2)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
