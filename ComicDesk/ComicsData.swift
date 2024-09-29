//
//  ComicsData.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation

protocol ComicsData {
    func loadComic(page: Int) async throws -> ComicDataDTO
    
}
