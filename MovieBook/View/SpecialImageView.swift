//
//  SpecialImageView.swift
//  MovieBook
//
//  Created by Fazlı Koç on 12.10.2022.
//

import SwiftUI

struct SpecialImageView: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url:String) {
        self.url = url
        self.imageDownloaderClient.downloaderImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!
            ).resizable()
        } else {
            return Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                .resizable()
        }
    }
}
struct SpecialImageView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImageView(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4dZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
       
    }
}




