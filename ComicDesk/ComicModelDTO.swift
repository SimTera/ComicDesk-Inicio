//
//  ComicModelDTO.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation

struct ComicModelDTO: Codable {
    let id: Int
    let title: String
    let titleEnglish: String?
    let titleJapanese: String?
    let url: String?
    let volumes: Int?
    let sypnosis: String?
    let score: Double
    let genres: [Genre]
    let demographics: [Demographic]
    let authors: [Author]
    let mainPicture: String
    let background: String?
    let endDate: String?
    let startDate: String?
    let chapters: Int?
    let themes: [Theme]
    let status: String
}

extension ComicModelDTO {
    var mapToComicModel: ComicModel {
        ComicModel(
            // tienen que haber todos los parametros que tenga en ComicModel recordar poner coma
            id: id,
            title: title,
            titleEnglish: titleEnglish,
            titleJapanese: titleJapanese,
            url: url,
            volumes: volumes,
            sypnosis: sypnosis,
            score: score,
            genres: genres,
            demographics: demographics,
            authors: authors,
            mainPicture: mainPicture,
            background: background,
            endDate: endDate,
            startDate: startDate,
            chapters: chapters,
            themes: themes,
            status: status,
            
            // Poner valores propios con valor no pueden estar vacios:
            
            isFavorit: false
//            isSave: false

        )
    }
}

struct Genre: Codable, Identifiable, Hashable{
    let id: String
    let genre: String
}
struct Demographic: Codable, Identifiable, Hashable{
    let id: String
    let demographic: String
}
struct Author: Codable, Identifiable, Hashable{
    let id: String
    let lastName: String
    let firstName: String
    let role: String
}
struct Theme: Codable, Identifiable, Hashable{
    let id: String
    let theme: String
}
