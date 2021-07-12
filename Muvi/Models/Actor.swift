//
//  Actor.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//

import Foundation

struct ActorResponse: Codable {
    var results: [Actor]
}

struct Actor: Codable, Identifiable {
    var id: Int?
    var name: String?
    var profile_path: String?
    var profilePhoto: String {
        if let path = profile_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }
        return "https://picsum.photos/200/300"
    }
}

