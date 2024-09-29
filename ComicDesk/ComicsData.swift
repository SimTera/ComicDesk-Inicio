//
//  ComicsData.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

//import Foundation
//
//protocol ComicsData {
//    var url: URL { get }
//    var queryItems: [URLQueryItem] { get }
//    
//    func getData() async throws -> ComicDataDTO
//
//}
//// Esto es avanzado:
//extension ComicsData {
//    func getData() async throws -> ComicDataDTO {
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
//        components.queryItems = queryItems
//        
//        let request = URLRequest.getRequest(url: components.url!)
//        let (data, _) = try await URLSession.shared.data(for: request)
//        
//        return try JSONDecoder().decode(ComicDataDTO.self, from: data)
//    }
//}
//
//struct ComicRepository: ComicsData {
//    var url: URL { URL.comicListURL }
//    var queryItems: [URLQueryItem] = []
//    
//    init(page: Int) {
//        self.queryItems = [
//            URLQueryItem(name: "page", value: "\(page)")
//        ]
//    }
//    
//}
//
//struct ComicSearchRepository: ComicsData {
//    var searchText: String
//    
//    var url: URL { URL.comicSearchContainsURL.appending(path: searchText) }
//    var queryItems: [URLQueryItem] = []
//    
//    init(searchText: String) {
//        self.searchText = searchText
//    }
//}
