//
//  MovieService.swift
//  Muvi
//
//  Created by Mirzayev Farid on 12.07.2021.
//


import SwiftUI

final class MovieService: ObservableObject {
    @Published var movies = [Movie]()
    @Published var cast = [Cast]()
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    func getNowPlaying() {
        getMovies(movieUrl: .nowPlaying)
    }
    
    func getUpcoming() {
        getMovies(movieUrl: .upcoming)
    }
    
    func getPopular() {
        getMovies(movieUrl: .popular)
    }
    
    func getCast(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        NetworkManager<CastResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.cast = response.cast
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func getMovies(movieUrl: MovieURL) {
        NetworkManager<MovieResponse>.fetch(from: movieUrl.urlString) { (result) in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let err):
                print(err)
            }
        }
    }
}
