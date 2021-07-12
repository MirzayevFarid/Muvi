//
//  NavBar.swift
//  Muvi
//
//  Created by Farid Mirzayev on 5.07.2021.
//

import SwiftUI

var tabs = ["play.circle", "heart.fill", "bell.fill", "person.fill"]

struct ContentView: View {
    
    var body: some View {
        BottomBar()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BottomBar: View {
    
    @State var selectedTab = "play.circle"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab){
                Home().tag("play.circle")
                Home().tag("heart.fill")
            }
            .disabled(true)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            
            HStack(spacing: 20) {
                ForEach(tabs, id: \.self){image in
                    TabButton(image: image, selectedTab: $selectedTab)
                }
            }
            .frame(width: screen.maxX - 100, height: 60, alignment: .center)
            .background(Color("Blue"))
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
}

struct TabButton : View {
    var image: String
    @Binding var selectedTab : String
    
    
    var body: some View{
        Button(action: {
                withAnimation(.spring()) {
                    selectedTab = image
                    print(selectedTab)
                }}){
            ZStack {
                Circle()
                    .foregroundColor(selectedTab == image ? .white :Color(#colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.968627451, alpha: 1)))
                    .frame(width: 50, height: 50)
                
                Image(systemName: image)
                    .frame(width: 30, height: 30)
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == image ? Color("Primary") : Color("Gray"))
            }
        }
    }
}
