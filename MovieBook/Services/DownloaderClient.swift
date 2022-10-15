//
//  DownloaderClient.swift
//  MovieBook
//
//  Created by Fazlı Koç on 3.10.2022.
//

import Foundation

class DownloaderClient {
    
    func detail(_ imdbID: String, _ completion: @escaping (Result<FilmDetay, DownloaderError>) -> Void) {

        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=964f9d31") else {
            return completion(.failure(.wrongURL))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.didntComeData))
            }

            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from: data) else {
                return completion(.failure(.wrongProcess))
            
            }
            

            completion(.success(gelenFilmDetayi))

        }.resume()

    }
    
    

    func downloadMovies(_ search: String, _ completion: @escaping (Result<[Search]?, DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=964f9d31") else {
            return completion(.failure(.wrongURL))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.didntComeData))
            }
            guard let movieResponse = try? JSONDecoder().decode(Movie.self, from: data) else {
                return completion(.failure(.wrongProcess))
            }

            completion(.success(movieResponse.search))
        }.resume()




    }

}


enum DownloaderError: Swift.Error {
    case wrongURL
    case didntComeData
    case wrongProcess
}
