//
//  NewNav.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//

import SwiftUI

struct NewNav: View {
    
    enum Tab: Int {
        case movie
        case discover
    }
    
    @State private var selectedTab = Tab.movie
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Home().tabItem {
                tabBarItem(text: "Movies", image: "film")
            }.tag(Tab.movie)
            
            Favorites().tabItem {
                tabBarItem(text: "Discover", image: "square.stack")
            }.tag(Tab.discover)
        }
    }
    
    private func tabBarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            
            Text(text)
        }
    }
}

struct NewNav_Previews: PreviewProvider {
    static var previews: some View {
        NewNav()
    }
}
