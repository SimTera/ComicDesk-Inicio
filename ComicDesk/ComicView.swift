//
//  ComicView.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import SwiftUI

struct ComicView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject private var vm = ComicViewModel()
    
    var comic: ComicModel
    
    var body: some View {
        HStack {
            AsyncImage(url: comic.mainPictureFormatURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 120)
                    .clipShape(Rectangle())
            } placeholder: { //esto es lo que va a salir mientras carga
                Image(systemName: "book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 120)
            }
            .layoutPriority(3)
            
            VStack(alignment: .leading) {
                Text(comic.title)
                    .font(.title2)
                    .bold()
                Text(comic.mainStartDateFormat ?? "")
                    .font(.subheadline)
                
                Text("Score: \(comic.score.formatted())")
                    .font(.headline)
                Text(comic.mainEndDateFormat ?? "")
                    .font(.subheadline)
            }
            .layoutPriority(1)
            Spacer()
            
            HStack {
                Image(systemName: comic.isFavorit ? "star.fill" : "star")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(comic.isFavorit ? .yellow : .gray)
            }
            .layoutPriority(2)
        }
    }
}

#Preview {
    ComicView(comic: .previewComic)
}
