//
//  ComicPreviewTest.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation
//esto no se sube a produccion

struct ComicsInteractorTest: ComicsInteractorProtocol {
    func loadComicsByDemographic(page: Int, text: String) async throws -> [ComicModel] {
        []
    }
    func loadComicsByGenre(page: Int, text: String) async throws -> [ComicModel] {
        []
    }
    func loadComicsByTheme(page: Int, text: String) async throws -> [ComicModel] {
        []
    }
    func searchOnStore(page: Int, text: String) async throws -> [ComicModel] {
        []
    }
    
    
    func fetchComics(page: Int) async throws -> [ComicModel] {
//        TODO: 2 cargar el json que metere en preview content desde local y acabar devolviendo mi array de comicmodel - DONE
        []
    }
}

extension ComicModel{
    
    static var previewComic: ComicModel{
        ComicModel(id: 94,
                   title: "D.N.Angel Prueba de texto largo",
                   titleEnglish: "D.N. Angel",
                   titleJapanese: "D・N・ANGEL",
                   url: "\"https://myanimelist.net/manga/94/DNAngel\"",
                   volumes: 20,
                   sypnosis: "Daisuke Niwa is an ordinary, if slightly unlucky, middle school student. On his fourteenth birthday, he comes down with a 'condition' that has plagued the men in his family for three hundred years. When he sees his crush, Risa, he transforms into his alter ego, the phantom thief Dark Mousy. Unfortunately, when Dark Mousy sees his crush, Risa's twin Riku, he transforms back into Daisuke. The only cure for this craziness is if Daisuke can get Risa to fall in love with him...\n\n(Source: Tokyopop)\n\nIncluded one-shots:\nVolume 1: Namaiki no 'N' (N is for Nishiki)\nVolume 2: OumagaAGAIN (The Demon Returns)\nVolume 4: Kanno-ke wa Kanai Anzen. (Protecting The Kanno House)",
                   score: 7.42,
                   genres: [Genre(id: "F974BCB6-B002-44A6-A224-90D1E50595A2", genre: "Comedy")],
                   demographics: [Demographic(id: "C217B404-7691-4090-9775-9E63375EBF5B", demographic: "Shoujo")],
                   authors: [Author(id: "43797A9F-7F29-42BD-89FE-90362A9EB3F3", lastName: "Sugisaki", firstName: "Yukiru", role: "Story & Art")],
                   mainPicture: "\"https://cdn.myanimelist.net/images/manga/2/145023l.jpg\"",
                   background: "D.N.Angel was first published in English by Tokyopop, who released the first 13 volumes from April 6, 2004 to December 8, 2009 before the closure of their North American division. VIZ Media digitally republished the Tokyopop volumes under the VIZ Select imprint from April 1, 2014 to September 23, 2014. The series went on an extended hiatus after the August 2005 issue, returning in the April 2008 issue. It went on another hiatus after the February 2011 issue, returning in the July 2018 issue.",
                   endDate: "2021-01-22T00:00:00Z",
                   startDate: "1997-01-01T00:00:00Z",
                   chapters: 108,
                   themes: [],
                   status: "finished",
                   isFavorit: false
//                   isSave: false
        )
    }
    
    
}
