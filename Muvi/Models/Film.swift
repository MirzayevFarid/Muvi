//
//  Film.swift
//  Muvi
//
//  Created by Farid Mirzayev on 5.07.2021.
//

import Foundation

struct MovieResponse: Codable {
    var results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int?
    var title: String?
    var original_language: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_average: Double?
    var vote_count: Int?
    var runtime: Int?
    var duration: String {
        if let duration = runtime {
            let (h, m) = secondsToHoursMinutes(seconds: duration)
            print("DURATION :::: ")
            print("\(h) Hours, \(m) Minutes")
            
            return "\(h) Hours, \(m) Minutes"
        } else {
            return "-"
        }
    }
    var video: Bool?
    var genre_ids: Array<Int>?
    var genreId: Int {
        return genre_ids?[0] ?? 28
    }
    var adult: Bool?
    var release_date: String?
    var posterPath: String {
        if let path = poster_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        } else {
            return ""
        }
    }
    var backdropPath: String {
        if let path = backdrop_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        } else {
            return ""
        }
    }
    var voteAverage: Double {
        if let avg = vote_average {
            return 5 * avg / 10
        }
        return 0.0
    }
    var titleWithLanguage: String {
        guard let title = title, let lang = original_language else { return "" }
        return "\(title)(\(lang))"
    }
}
