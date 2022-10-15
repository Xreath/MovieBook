//
//  ContentView.swift
//  MovieBook
//
//  Created by Fazlı Koç on 3.10.2022.
//

import SwiftUI

struct MovieListView: View {

    @ObservedObject var _viewModel: FilmListeViewModel
    @State var aranacakFilm: String = ""



    init() {
        self._viewModel = FilmListeViewModel()
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged: { _ in }, onCommit: {
                    self._viewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                }).padding().textFieldStyle(RoundedBorderTextFieldStyle())

                List(_viewModel.filmler, id: \.imdbId) {
                    film in

                    NavigationLink {
                        DetailView(imdbId: film.imdbId)
                    } label: {
                        HStack {
                            SpecialImageView(url: film.poster).padding(.trailing, 8.0).frame(width: 100, height: 150, alignment: .center)

                            VStack(alignment: .leading, content: {
                                Text(film.title).font(.title3).foregroundColor(.blue)
                                Text(film.year).foregroundColor(.orange)
                            })
                        }
                    }
                }.navigationTitle(Text("Moive Book"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
