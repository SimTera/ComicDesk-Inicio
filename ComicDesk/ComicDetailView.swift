//
//  ComicDetailView.swift
//  ComicDesk
//
//  Created by Victor Munera on 12/9/24.
//

import SwiftUI

struct ComicDetailView: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var vm = ComicViewModel()
    @State var isShowingSheet = false
    
    var comic: ComicModel
        
    var body: some View {
        ScrollView {
            VStack{
                AsyncImage(url: comic.mainPictureFormatURL) { images in
                    images
                        .resizable()
                        .scaledToFit()
                }placeholder: {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                }
                
                Text(comic.titleJapanese ?? "").font(.title3)
                
                HStack {
                    Button{
                        vm.toggleIsFavorit(for: comic, using: modelContext)

                    }label: {
                        Image(systemName: "star.fill")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(comic.isFavorit ? .yellow : .gray)
                    }
                    
                    Button {
                        //                    TODO: Este boton lo que deberia es abrirme un menu diciendome que numeros de volumenes tnego y el que quiero y que se guarde cuando le de al boton de continuar o de confirmar -DONE
                        isShowingSheet = true
                    }label: {
                        Image(systemName: "square.and.arrow.down")
                            .font(.title2)
                    }
                    .sheet(isPresented: $isShowingSheet) {
                            FormView(comic: comic)
                        }
                }
                .padding()
                
                Grid{
                    GridRow{
                        Text("Volumes")
                        Text("Capitulo")
                    }
                    Divider()
                    GridRow{
                        Text("\(comic.volumes ?? 0)")
                        Text("\(comic.chapters ?? 0)")
                    }
                }
                Divider()
                
                HStack{
                    Text("Start: \(comic.mainStartDateFormat ?? "")")
                        .padding(.horizontal)
                    Text("End: \(comic.mainEndDateFormat ?? "")")
                        .padding(.horizontal)
                }
                .padding(.vertical)
                
                Grid{
                    GridRow{
                        Text("Tomos que tienes: \(UserDefaults.standard.integer(forKey: "purchasedVolumes_\(comic.id)"))")
                        Image(systemName: "folder")
                    }
                    Divider()
                    GridRow{
                        Text("Por donde vas: \(UserDefaults.standard.integer(forKey: "currentVolume_\(comic.id)"))")
                        Image(systemName: "book")
                    }
                    Divider()
                }
                .padding(.vertical)
                
                Section("Synopsis"){
                    Text("\(comic.sypnosis ?? " ")")
                        .padding()
                }
                
                Section("Background"){
                    Text("\(comic.background ?? "")")
                        .padding()
                }
            }
        }
        .navigationTitle(comic.title)
    }
}

#Preview {
    ComicDetailView(comic: .previewComic)
}
