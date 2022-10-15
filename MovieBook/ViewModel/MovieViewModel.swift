//
//  MovieViewModel.swift
//  MovieBook
//
//  Created by Fazlı Koç on 10.10.2022.
//

import SwiftUI

class FilmListeViewModel : ObservableObject {
    
    @Published  var filmler = [FilmViewModel]()
    
   private let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi : String) {
        downloaderClient.downloadMovies(filmIsmi) { (sonuc) in
            switch sonuc {
                case.failure(let hata):
                    print(hata)
                case .success(let filmDizisi):
                    if let filmDizisi = filmDizisi {
                        DispatchQueue.main.async {
                            self.filmler = filmDizisi.map(FilmViewModel.init)
                        }
                    }
            }
        }
    }
}

struct FilmViewModel {
    
    let film : Search
    
    var title : String {
        film.title ?? "Title"
    }
    
    var poster : String {
        film.poster ?? "Poster"
    }
    
    var year : String {
        film.year ?? "Year"
    }
    
    var imdbId : String {
        film.imdbID ?? "imdbID"
    }
    
}
