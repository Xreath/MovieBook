//
//  ImageDownloaderClient.swift
//  MovieBook
//
//  Created by Fazlı Koç on 12.10.2022.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
     @Published var downloadedImage :Data?
    
    
    func downloaderImage(url:String){
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data , error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage=data
            }
        }.resume()
        
    }
}
