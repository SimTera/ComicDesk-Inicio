//
//  ComicsMenuView.swift
//  ComicDesk
//
//  Created by Victor Munera on 16/9/24.
//

import SwiftUI

struct ComicsMenuView: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var viewmodel: ComicViewModel
    @State private var showingSaveView = false
    
    let themes = [
        "School", "Gore", "Military", "Mythology", "Psychological",
        "Historical", "Samurai", "Romantic Subtext", "Adult Cast",
        "Parody", "Super Power", "Team Sports", "Delinquents",
        "Workplace", "Survival", "Childcare", "Iyashikei",
        "Reincarnation", "Showbiz", "Anthropomorphic", "Love Polygon",
        "Music", "Mecha", "Combat Sports", "Isekai", "Gag Humor",
        "Crossdressing", "Reverse Harem", "Martial Arts", "Visual Arts",
        "Harem", "Otaku Culture", "Time Travel", "Video Game",
        "Strategy Game", "Vampire", "Mahou Shoujo", "High Stakes Game",
        "CGDCT", "Organized Crime", "Detective", "Performing Arts",
        "Medical", "Space", "Memoir", "Villainess", "Racing", "Pets",
        "Magical Sex Shift", "Educational", "Idols (Female)", "Idols (Male)"
    ]
    
    let genre = [
        "Action", "Adventure", "Award Winning", "Drama", "Fantasy",
        "Horror", "Supernatural", "Mystery", "Slice of Life", "Comedy",
        "Sci-Fi", "Suspense", "Sports", "Ecchi", "Romance", "Girls Love",
        "Boys Love", "Gourmet", "Erotica", "Hentai", "Avant Garde"
    ]
    
    let demographics = [
        "Seinen",
        "Shounen",
        "Shoujo",
        "Josei",
        "Kids"
    ]
    
    var body: some View {
        //        TODO: Meter esto en un ForEach para que se vea mas limpio.-DONE
        HStack{
            Menu{
                Menu("Theme"){
                    ForEach(themes, id: \.self) { theme in
                        Button(theme) {
                            Task{
                                viewmodel.comics.removeAll()
                                await viewmodel.loadComicsByTheme(theme: theme.lowercased())
                            }
                        }
                    }
                }
                
                Menu("Genre"){
                    ForEach(genre, id: \.self) { genre in
                        Button(genre) {
                            Task{
                                viewmodel.comics.removeAll()
                                await viewmodel.loadComicsByGenre(genre: genre.lowercased())
                            }
                        }
                    }
                }
                Menu("Demographic"){
                    ForEach(demographics, id: \.self) { demographic in
                        Button(demographic) {
                            Task{
                                viewmodel.comics.removeAll()
                                await viewmodel.loadComicsByDemographic(demographic: demographic)
                            }
                        }
                    }
                }
                
                Button{
                    viewmodel.loadSaveComic(using: modelContext)
                    showingSaveView = true
                }label: {
                    Text("Mi save")
                }
            }label: {
                Label("Options", systemImage: "ellipsis.circle")
            }
            .sheet(isPresented: $showingSaveView) {
                ComicSaveView(viewModel: viewmodel)
            }
            
            Button{
                Task{
                    viewmodel.comics.removeAll()
                    await viewmodel.resetToNormalValor()
                }
            }label: {
                Label("Reset", systemImage: "clear")
            }
        }
    }
}
