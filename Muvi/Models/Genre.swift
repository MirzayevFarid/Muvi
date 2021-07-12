//
//  Genre.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//

import Foundation

struct GenreResponse: Codable {
    var genres: [Genre]
}

struct Genre: Codable, Identifiable {
    var id: Int?
    var name: String?
}

extension Genre: Equatable {
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name
    }
}
