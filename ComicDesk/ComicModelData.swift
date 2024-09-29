//
//  ComicModelData.swift
//  ComicDesk
//
//  Created by Victor Munera on 19/9/24.
//

import Foundation
import SwiftData

@Model
class ComicModelData: Identifiable, Hashable {
    @Attribute(.unique) var id: Int // con esto hace que no lo pueda guardar mas de una vez
    var title: String
    var titleEnglish: String?
    var titleJapanese: String?
    var url: String?
    var volumes: Int?
    var sypnosis: String?
    var score: Double
    var genres: [Genre]
    var demographics: [Demographic]
    var authors: [Author]
    var mainPicture: String
    var background: String?
    var endDate: String?
    var startDate: String?
    var chapters: Int?
    var themes: [Theme]
    var status: String
    
    //Valores propios:
    var isFavorit: Bool
    
    
    //Aqui he de hacer los cambios de formato de imagen a url valida y fechas etc:

    var mainPictureFormatURL: URL?{
        let urlString = mainPicture.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return URL(string: urlString)
    }
    var mainStartDateFormat: String?{
        guard let dateString = startDate?.trimmingCharacters(in: CharacterSet(charactersIn: "T00:00:00Z")) else { return "faile" }
        return String?(dateString)
    }
    var mainEndDateFormat: String?{
        guard let dateString = endDate?.trimmingCharacters(in: CharacterSet(charactersIn: "T00:00:00Z")) else { return "faile" }
        return String?(dateString)
    }
    init(from model: ComicModel) { // Acepto un comicmodel como inicializador para que me sea mas facil el guardar asi me ahorro el mapeo
        self.id = model.id
        self.title = model.title
        self.titleEnglish = model.titleEnglish
        self.titleJapanese = model.titleJapanese
        self.url = model.url
        self.volumes = model.volumes ?? 0
        self.sypnosis = model.sypnosis
        self.score = model.score
        self.genres = model.genres
        self.demographics = model.demographics
        self.authors = model.authors
        self.mainPicture = model.mainPicture
        self.background = model.background
        self.endDate = model.endDate
        self.startDate = model.startDate
        self.chapters = model.chapters ?? 0
        self.themes = model.themes
        self.status = model.status
        self.isFavorit = model.isFavorit
    }
}
