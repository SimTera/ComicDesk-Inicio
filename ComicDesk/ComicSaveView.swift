//
//  ComicSaveView.swift
//  ComicDesk
//
//  Created by Victor Munera on 22/9/24.
//

import SwiftUI
import SwiftData

struct ComicSaveView: View {
    
    @Environment(\.modelContext)  var modelContext
    @ObservedObject var viewModel: ComicViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.savedComics) { comic in
                    Section("ID: \(comic.id)") {
                        HStack {
                            AsyncImage(url: comic.mainPictureFormatURL) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 120)
                                    .clipShape(Rectangle())
                            } placeholder: {
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
                                
                                HStack {
                                    Text("Colección completa:").font(.subheadline)
                                    Text(comic.volumes == UserDefaults.standard.integer(forKey: "purchasedVolumes_\(comic.id)") ? "Sí" : "No")
                                        .foregroundColor(comic.volumes == UserDefaults.standard.integer(forKey: "purchasedVolumes_\(comic.id)") ? .green : .red)
                                    Spacer()
                                }
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
                .onDelete { offsets in
                    viewModel.deleteComic(at: offsets, using: modelContext)
                }
            }
            .onAppear {
                viewModel.loadSaveComic(using: modelContext)
            }
        }
    }
}

#Preview {
    ComicSaveView(viewModel: ComicViewModel())
}

