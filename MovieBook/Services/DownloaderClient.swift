//
//  DownloaderClient.swift
//  MovieBook
//
//  Created by Fazlı Koç on 3.10.2022.
//

import Foundation

class DownloaderClient {
    
    
    func downloadMovies(_ search:String, _ completion: @escaping (Result<[Search]?, DownloaderError>) -> Void) {
        guard  let url:String = "https://www.omdbapi.com/?s=\(search)&apikey=964f9d31" else{
            return completion(.failure(.wrongURL))
        }

    }
}

enum DownloaderError :Swift.Error{
    case wrongURL
    case didntCome
    case wrongProcess
}
