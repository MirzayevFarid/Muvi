//
//  TheatreView.swift
//  Muvi
//
//  Created by Mirzayev Farid on 16.07.2021.
//

import SwiftUI

struct TheatreView: View {
    @Binding var selectedSeats:[Seat]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.3), .clear]) , startPoint: .init(x: 0.5, y: 0.0), endPoint: .init(x: 0.5, y: 0.5)) )
                .frame(height: 420)
                .clipShape(ScreenShape(isClip: true))
                .cornerRadius(20)
            
            ScreenShape()
                .stroke(style:  StrokeStyle(lineWidth: 5,  lineCap: .square ))
                .frame(height: 420)
                .foregroundColor(.accentColor)
            
            VStack {
                createFrontRows()
                createBackRows()
                createSeatsLegend()
            }
        }
    }
    
    fileprivate func createFrontRows() -> some View {
        let rows: Int = 2
        let numbersPerRow: Int = 7
        
        return
            VStack {
                ForEach(0..<rows, id: \.self) { row in
                    HStack{
                        ForEach(0..<numbersPerRow, id: \.self){ number in
                            ChairView(width: 30, accentColor: .accentColor, seat: Seat(id: UUID(), row: row + 1, number: number + 1) , onSelect: { seat in
                                self.selectedSeats.append(seat)
                            }, onDeselect: { seat in
                                self.selectedSeats.removeAll(where: {$0.id == seat.id})
                            })
                        }
                    }
                }
            }
    }
    fileprivate func createBackRows() -> some View {
        
        
        let rows: Int = 5
        let numbersPerRow: Int = 9
        
        return
            
            VStack {
                ForEach(0..<rows, id: \.self) { row in
                    HStack{
                        ForEach(0..<numbersPerRow, id: \.self){ number in
                            ChairView(width: 30, accentColor: .accentColor, seat: Seat(id: UUID(), row: row + 3, number: number + 1) , onSelect: { seat in
                                self.selectedSeats.append(seat)
                            }, onDeselect: { seat in
                                self.selectedSeats.removeAll(where: {$0.number == seat.number})
                            })
                        }
                    }
                }
            }
    }
    fileprivate func createSeatsLegend() -> some View{
        HStack{
            ChairLegend(text: "Selected", color: .accentColor)
            ChairLegend(text: "Reserved", color: .purple)
            ChairLegend(text: "Available", color: .gray)
        }.padding(.horizontal, 20).padding(.top)
    }
}
struct TheatreView_Previews: PreviewProvider {
    static var previews: some View {
        TheatreView(selectedSeats: .constant([]))
    }
}
