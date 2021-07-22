//
//  ChairView.swift
//  Muvi
//
//  Created by Mirzayev Farid on 16.07.2021.
//

import SwiftUI
struct ChairView: View {
    
    var width: CGFloat = 50
    var accentColor: Color = .blue
    var seat = Seat.default
    @State private var isSelected = false
    var isSelectable = true
    var onSelect: ((Seat)->()) = {_ in }
    var onDeselect: ((Seat)->()) = {_ in }
    
    
    var body: some View {
        VStack(spacing: 2) {
            
            ZStack{
                Text("\(seat.number) / \(seat.row)").font(.system(size: 10))
                
                    Rectangle()
                        .frame(width: self.width, height: self.width * 2/3)
                        .foregroundColor(isSelectable ? isSelected ? accentColor : Color.gray.opacity(0.5) : accentColor)
                    .cornerRadius(width / 5)
                    
            }
                    Rectangle()
                        .frame(width: width - 10, height: width / 5)
                        .foregroundColor(isSelectable ? isSelected ? accentColor :  Color.gray.opacity(0.5) : accentColor)
                        .cornerRadius(width / 5)
                }.onTapGesture {
                    if self.isSelectable{
                        self.isSelected.toggle()
                        if self.isSelected{
                            self.onSelect(self.seat)
                        } else {
                            self.onDeselect(self.seat)
                        }
                    }
                }
    }
}
struct ChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChairView()
    }
}
