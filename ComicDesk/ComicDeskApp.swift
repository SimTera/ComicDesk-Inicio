//
//  ComicDeskApp.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import SwiftUI
import SwiftData

@main
struct ComicDeskApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(viewmodel: ComicViewModel())
        }
        .modelContainer(for: ComicModelData.self)
    }
}
