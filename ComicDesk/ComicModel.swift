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
    
    //Valores propios y cambios de formato:
    var isFavorit: Bool = false

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
