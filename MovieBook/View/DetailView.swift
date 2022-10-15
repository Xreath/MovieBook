//
//  DetailView.swift
//  MovieBook
//
//  Created by Fazlı Koç on 16.10.2022.
//

import SwiftUI



struct DetailView: View {

    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    init(imdbId: String) {
        self.imdbId = imdbId
        self.filmDetayViewModel = filmDetayViewModel
        self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)

        
    }
    
    
    var body: some View {
        VStack(alignment:.leading, spacing:5){
            HStack{
                Spacer()
                SpecialImageView(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                Spacer()
            }
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film Ismi Gösterilecek").font(.title).foregroundColor(.blue).padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
            
            Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
            
            Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")").padding()
            
            Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
            
            Text("Yıl: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")").padding()
            
            Spacer()
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
