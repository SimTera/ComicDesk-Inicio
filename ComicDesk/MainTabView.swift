//
//  MainTabView.swift
//  ComicDesk
//
//  Created by Victor Munera on 29/9/24.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewmodel: ComicViewModel
    
    var body: some View {
        TabView{
            ComicStoreView()
                .tabItem{ Label("Home", systemImage: "house.and.flag") }
            ComicSaveView(viewModel: viewmodel)
                .tabItem{ Label("Library", systemImage: "books.vertical")}
        }
    }
}

#Preview {
    MainTabView(viewmodel: ComicViewModel())
}
