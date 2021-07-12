//
//  Review.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//
import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}

