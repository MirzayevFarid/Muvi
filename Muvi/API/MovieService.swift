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
    @Published var actors = [Actor]()
    @Published var genres = [Genre]()
    
    static var movieBaseURL = "https://api.themoviedb.org/3/movie/"
    static var personBaseUrl = "https://api.themoviedb.org/3/person/popular/"
    static var genreBaseURL = "https://api.themoviedb.org/3/genre/movie/list"
    
    
    func getNowPlaying() {
        getMovies(movieUrl: .nowPlaying)
    }
    
    func getUpcoming() {
        getMovies(movieUrl: .upcoming)
    }
    
    func getPopular() {
        getMovies(movieUrl: .popular)
    }
    
    func getTopRated() {
        getMovies(movieUrl: .topRated)
    }
    
    func getCast(for movie: Movie) {
        cast.removeAll()
        let urlString = "\(Self.movieBaseURL)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        print(urlString)
        NetworkService<CastResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.cast = response.cast
                print(response.cast)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
    func getActors() {
        actors.removeAll()
        let urlString = "\(Self.personBaseUrl)/?api_key=\(API.key)&language=en-US"
        NetworkService<ActorResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.actors = response.results
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getGenres() {
        genres.removeAll()
        let urlString = "\(Self.genreBaseURL)?api_key=\(API.key)&language=en-US"
        NetworkService<GenreResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.genres = response.genres
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
    func getGenreById(id: Int) -> String {
        getGenres()
        for genreSample in genres {
            if(genreSample.id == id)
            {
                return(genreSample.name ?? "-")
            }
        }
        
        return "-"
    }
    
    private func getMovies(movieUrl: MovieURL) {
        movies.removeAll()
        NetworkService<MovieResponse>.fetch(from: movieUrl.urlString) { (result) in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let err):
                print(err)
            }
        }
    }
}
