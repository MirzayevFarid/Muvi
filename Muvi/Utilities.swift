//
//  NewNav.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//

import SwiftUI

let screen = UIScreen.main.bounds

func getCardWidth() -> CGFloat {
    if screen.width > 712 {
        return 712
    }
    return screen.width - 60
}

func getCardHeight() -> CGFloat {
    if screen.width > 712 {
        return 80
    }
    return 280
}

func getAngleMultiplier() -> Double {
    if screen.width > 500 {
        return 70
    } else {
        return 30
    }
}

func secondsToHoursMinutes (seconds : Int) -> (Int, Int) {
  return (seconds / 3600, (seconds % 3600) / 60)
}
