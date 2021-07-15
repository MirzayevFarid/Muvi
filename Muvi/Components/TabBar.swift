////
////  TabBar.swift
////  DesignCode
////
////  Created by Meng To on 2019-12-09.
////  Copyright © 2019 Meng To. All rights reserved.
////
//
//import SwiftUI
//
//struct TabBar: View {
//    @State var selectedTab = "play.circle"
//    
//    var body: some View {
//        ZStack {
//            TabView(selection: $selectedTab) {
//                
//                switch selectedTab{
//                
//                case "play.circle" : Home().tabItem {
//                    Image(systemName: "play.circle")
//                    Text("Home")
//                }.tag("play.circle")
//                case "heart.fill" : Favorites().tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Courses")
//                }.tag("heart.fill")
//                default:
//                    Home().tabItem {
//                        Image(systemName: "play.circle")
//                        Text("Home")
//                    }
//                }
//            }
////                        .edgesIgnoringSafeArea(.top)
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .ignoresSafeArea(.all, edges: .bottom)
//            
//            HStack(spacing: 20) {
//                ForEach(tabs, id: \.self){image in
//                    TabButton(image: image, selectedTab: $selectedTab)
//                }
//            }
//            .frame(width: screen.maxX - 100, height: 60, alignment: .center)
//            .background(Color("Blue"))
//            .clipShape(RoundedRectangle(cornerRadius: 30))
//        }
//        
//        
//        
//    }
//}
//
//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//        
//    }
//}
