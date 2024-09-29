//
//  ComicsInteractor.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation

protocol ComicsInteractorProtocol {
    
    func fetchComics(page: Int) async throws -> [ComicModel]
    func searchOnStore(page: Int, text: String) async throws -> [ComicModel]
    func loadComicsByTheme(page: Int, text: String) async throws -> [ComicModel]
    func loadComicsByGenre(page: Int, text: String) async throws -> [ComicModel]
    func loadComicsByDemographic(page: Int, text: String) async throws -> [ComicModel]
}

struct ComicsInteractor: ComicsInteractorProtocol {
    func fetchComics(page: Int) async throws -> [ComicModel] {
        
        let (data, _) = try await URLSession.shared.data(from: .comicListURL(page: page))
        
        return try JSONDecoder().decode(ComicDataDTO.self, from: data).items.map(\.mapToComicModel)
    }
}

extension ComicsInteractor {
    func searchOnStore(page: Int, text: String) async throws -> [ComicModel] {
        let (data, _) = try await URLSession.shared.data(from: .comicSearchContainsURL(page: page).appending(path: text))
        return try JSONDecoder().decode(ComicDataDTO.self, from: data).items.map(\.mapToComicModel)
    }
    
//    TODO: Comprobar si esta cargando correctamente la url, crear un let con url y generar la url para poder ver en impresion que me esta generando y como hacer para crearla bien - DONE
    func loadComicsByTheme(page: Int, text: String) async throws -> [ComicModel] {
//        let url = URL.comicForThemeURL(page: page).appending(path: text) //Para comprobar el fallo de url, era que estaba llamando al listado de generos en vez de a los mangas por generos
//        print("Loading Comics by Theme URL: \(url)")
        let (data, _) = try await URLSession.shared.data(from: .comicForThemeURL(page: page).appending(path: text))
//        print("Response Data: \(String(data: data, encoding: .utf8) ?? "faild decoding data")")// no me esta generando la url de manera correcta
        return try JSONDecoder().decode(ComicDataDTO.self, from: data).items.map(\.mapToComicModel)
    }
    
    //TODO: He de crear aqui los interactors de genre y demographic
    func loadComicsByGenre(page: Int, text: String) async throws -> [ComicModel] {
        let (data, _) = try await URLSession.shared.data(from: .comicForGenresURL(page: page).appending(path: text))
        return try JSONDecoder().decode(ComicDataDTO.self, from: data).items.map(\.mapToComicModel)
    }
    
    func loadComicsByDemographic(page: Int, text: String) async throws -> [ComicModel] {
        let (data, _) = try await URLSession.shared.data(from: .comicForDemographicURL(page: page).appending(path: text))
        return try JSONDecoder().decode(ComicDataDTO.self, from: data).items.map(\.mapToComicModel)
    }
}

struct ComicListInteractorTest: ComicsInteractorProtocol {
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
        
        guard let url = Bundle.main.url(forResource: "ComicTestPaginated", withExtension: "json") else { return [] }
        let data = try Data(contentsOf: url)
        
        return try JSONDecoder().decode(ComicDataDTO.self, from: data).items.map(\.mapToComicModel)
    }
}
