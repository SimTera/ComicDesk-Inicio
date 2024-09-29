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
    
    var body: some View {
//        TODO: Meter esto en un ForEach para que se vea mas limpio.
        HStack{
            Menu{
                Menu("Theme"){
                    Button("School") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "school")
                        }
                    }
                    Button("Gore") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "gore")
                        }
                    }
                    Button("Military") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "military")
                        }
                    }
                    Button("Mythology") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "mythology")
                        }
                    }
                    Button("Psychological") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "psychological")
                        }
                    }
                    Button("Historical") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "historical")
                        }
                    }
                    Button("Samurai") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "samurai")
                        }
                    }
                    Button("Romantic Subtext") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "romantic subtext")
                        }
                    }
                    Button("Adult Cast") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "adult cast")
                        }
                    }
                    Button("Parody") {
                        Task{
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "parody")
                        }
                    }
                    Button("Super Power") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "super power")
                        }
                    }
                    Button("Team Sports") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "team sports")
                        }
                    }
                    Button("Delinquents") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "delinquents")
                        }
                    }
                    Button("Workplace") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "workplace")
                        }
                    }
                    Button("Survival") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "survival")
                        }
                    }
                    Button("Childcare") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "childcare")
                        }
                    }
                    Button("Iyashikei") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "iyashikei")
                        }
                    }
                    Button("Reincarnation") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "reincarnation")
                        }
                    }
                    Button("Showbiz") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "showbiz")
                        }
                    }
                    Button("Anthropomorphic") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "anthropomorphic")
                        }
                    }
                    Button("Love Polygon") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "love polygon")
                        }
                    }
                    Button("Music") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "music")
                        }
                    }
                    Button("Mecha") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "mecha")
                        }
                    }
                    Button("Combat Sports") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "combat sports")
                        }
                    }
                    Button("Isekai") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "isekai")
                        }
                    }
                    Button("Gag Humor") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "gag humor")
                        }
                    }
                    Button("Crossdressing") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "crossdressing")
                        }
                    }
                    Button("Reverse Harem") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "reverse harem")
                        }
                    }
                    Button("Martial Arts") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "martial arts")
                        }
                    }
                    Button("Visual Arts") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "visual arts")
                        }
                    }
                    Button("Harem") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "harem")
                        }
                    }
                    Button("Otaku Culture") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "otaku culture")
                        }
                    }
                    Button("Time Travel") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "time travel")
                        }
                    }
                    Button("Video Game") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "video game")
                        }
                    }
                    Button("Strategy Game") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "strategy game")
                        }
                    }
                    Button("Vampire") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "vampire")
                        }
                    }
                    Button("Mahou Shoujo") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "mahou shoujo")
                        }
                    }
                    Button("High Stakes Game") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "high stakes game")
                        }
                    }
                    Button("CGDCT") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "cgdct")
                        }
                    }
                    Button("Organized Crime") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "organized crime")
                        }
                    }
                    Button("Detective") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "detective")
                        }
                    }
                    Button("Performing Arts") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "performing arts")
                        }
                    }
                    Button("Medical") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "medical")
                        }
                    }
                    Button("Space") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "space")
                        }
                    }
                    Button("Memoir") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "memoir")
                        }
                    }
                    Button("Villainess") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "villainess")
                        }
                    }
                    Button("Racing") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "racing")
                        }
                    }
                    Button("Pets") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "pets")
                        }
                    }
                    Button("Magical Sex Shift") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "magical sex shift")
                        }
                    }
                    Button("Educational") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "educational")
                        }
                    }
                    Button("Idols (Female)") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "idols (female)")
                        }
                    }
                    Button("Idols (Male)") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByTheme(theme: "idols (male)")
                        }
                    }
                }
                
                Menu("Genre"){
                    Button("Action") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "action")
                        }
                    }
                    Button("Adventure") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "adventure")
                        }
                    }
                    Button("Award Winning") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "award winning")
                        }
                    }
                    Button("Drama") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "drama")
                        }
                    }
                    Button("Fantasy") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "fantasy")
                        }
                    }
                    Button("Horror") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "horror")
                        }
                    }
                    Button("Supernatural") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "supernatural")
                        }
                    }
                    Button("Mystery") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "mystery")
                        }
                    }
                    Button("Slice of Life") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "slice of life")
                        }
                    }
                    Button("Comedy") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "comedy")
                        }
                    }
                    Button("Sci-Fi") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "sci-fi")
                        }
                    }
                    Button("Suspense") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "suspense")
                        }
                    }
                    Button("Sports") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "sports")
                        }
                    }
                    Button("Ecchi") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "ecchi")
                        }
                    }
                    Button("Romance") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "romance")
                        }
                    }
                    Button("Girls Love") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "girls love")
                        }
                    }
                    Button("Boys Love") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "boys love")
                        }
                    }
                    Button("Gourmet") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "gourmet")
                        }
                    }
                    Button("Erotica") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "erotica")
                        }
                    }
                    Button("Hentai") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "hentai")
                        }
                    }
                    Button("Avant Garde") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByGenre(genre: "avant garde")
                        }
                    }
                }
                Menu("Demographic"){
                    Button("Seinen") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByDemographic(demographic: "seinen")
                        }
                    }
                    Button("Shounen") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByDemographic(demographic: "shounen")
                        }
                    }
                    Button("Shoujo") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByDemographic(demographic: "shoujo")
                        }
                    }
                    Button("Josei") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByDemographic(demographic: "josei")
                        }
                    }
                    Button("Kids") {
                        Task {
                            viewmodel.comics.removeAll()
                            await viewmodel.loadComicsByDemographic(demographic: "kids")
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
                                ComicSaveView()
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
