//
//  URL.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation

let URLBase = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com")!

extension URL {
    static let comicBestURL = URLBase.appending(path: "list/bestMangas")
    static let comicThemesURL = URLBase.appending(path: "list/theme")
    static let comicDemographicURL = URLBase.appending(path: "list/genres")
    
    static func comicListURL(page: Int)-> URL {
        URLBase.appending(path: "list/mangas")
            .appending(queryItems: [.pageQuery(page: page)])
    }
    
    static func comicForThemeURL(page: Int)-> URL {
        URLBase.appending(path: "list/mangaByTheme")
            .appending(queryItems: [.pageQuery(page: page)])
    }
    
    static func comicForGenresURL(page: Int)-> URL {
        URLBase.appending(path: "list/mangaByGenre")
            .appending(queryItems: [.pageQuery(page: page)])
    }
    
    static func comicForDemographicURL(page: Int)-> URL {
        URLBase.appending(path: "list/mangaByDemographic")
            .appending(queryItems: [.pageQuery(page: page)])
    }
    
    static func comicSearchContainsURL(page: Int)-> URL {
        URLBase.appending(path: "search/mangasContains")// hay que añadir /texto a buscar
            .appending(queryItems: [.pageQuery(page: page)])
    }
}

extension URLQueryItem { //Esto es una fomra mas elegante de hacer los querys
    static func pageQuery (page: Int) -> URLQueryItem {
        URLQueryItem(name: "page", value: "\(page)")
    }
}

extension URLRequest {
    
    static func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url) //esta url es la del getrequest de arriba
        // creamos  una request en la linea 15 y creamos varias request
        request.setValue("Token", forHTTPHeaderField: "Autorizacion") //esto son headers obligatorios que te dice la API
        request.setValue("application/json", forHTTPHeaderField: "accept") //este tambien en mi caso no se usara a menos que pida el token cunado llegue
        
        return request
    }
}
