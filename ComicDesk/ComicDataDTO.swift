//
//  ComicDataDTO.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation

struct ComicDataDTO: Codable {
    let metadata: Metadata
    let items: [ComicModelDTO]
}

struct Metadata: Codable {
    let page: Int
    let total: Int
    let per: Int    
}
