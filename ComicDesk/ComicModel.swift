//
//  ComicModel.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation

struct ComicModel: Identifiable, Hashable {
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
    
    //Valores propios:
//    var writeGenre: TextField("")
    var isFavorit: Bool = false
//    var isSave: Bool
    
    
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
}

//extension ComicModel { //esto deja de ser necesario al mapear, ya que el inicializador en ComicModelData cubre la funcionalidad.
//
//    func mapToComicModelData (from model: ComicModel)-> ComicModelData {
//        return ComicModelData(
//            id: model.id,
//            title: model.title,
//            url: model.url,
//            volumes: model.volumes ?? 0,
//            sypnosis: model.sypnosis ?? "Not data",
//            score: model.score,
//            genres: model.genres,
//            demographics: model.demographics,
//            authors: model.authors,
//            mainPicture: model.mainPicture,
//            background: model.background ?? "Not data",
//            endDate: model.endDate,
//            startDate: model.startDate,
//            chapters: model.chapters ?? 0,
//            themes: model.themes,
//            status: model.status,
//            isFavorit: model.isFavorit,
//            isSave: model.isSave
//        )
//    }
//}
