//
//  TicketDate.swift
//  Muvi
//
//  Created by Mirzayev Farid on 16.07.2021.
//

import SwiftUI

import Foundation
struct TicketDate: Equatable
{
    var day: String
    var month: String
    var year: String
    static var `default`: TicketDate
    {
        TicketDate(day: "", month: "", year: "")
    }
}
