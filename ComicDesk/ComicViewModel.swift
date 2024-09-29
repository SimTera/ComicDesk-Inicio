//
//  ComicViewModel.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import Foundation
import SwiftData
import SwiftUI

final class ComicViewModel: ObservableObject {

    @Published var comics: [ComicModel] = []
    @Published var savedComics: [ComicModelData] = []
    @Published var currentPage: Int = 1
    @Published var totalComics: Int = 1
    @Published var comicsPerPage: Int = 0
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    @Published var searchTerm = ""
    @Published var isFiltering: Bool = false
    @Published var isFavorit = false
    @Published var volumes: Int?
    
    var currentFilter: FilterType?
    var count = 0 // para comprobar cuantas paginas se llaman
    private var repository: ComicsInteractorProtocol
    private let totalPages = 6484
    
    init(repository: ComicsInteractorProtocol = ComicsInteractor()) {
        self.repository = repository
        Task {
            await loadComics()
        }
    }

    enum FilterType {
        case theme(String)
        case genre(String)
        case demographic(String)
    }
    
    @MainActor
    func loadComics() async {
        guard !isLoading else { return }
        self.isLoading = true
        do {
            var comicData = try await repository.fetchComics(page: currentPage)

            for i in 0..<comicData.count {
                let comicID = comicData[i].id
                let isFavorit = UserDefaults.standard.bool(forKey: "isFavorit_\(comicID)")
                comicData[i].isFavorit = isFavorit
            }
            
            comics += comicData
            print(comics.count) //Comprobar que se van sumando comics
        }catch {
            self.error = error
        }
        self.isLoading = false
    }
    
    func loadSaveComic(using modelContext: ModelContext) {
        do {
            let descriptor = FetchDescriptor<ComicModelData>()
            let request = try modelContext.fetch(descriptor)

            let syncedComics = request.map { comic in
                let updatedComic = comic
                let isFavorit = UserDefaults.standard.bool(forKey: "isFavorit_\(comic.id)")
                updatedComic.isFavorit = isFavorit
                return updatedComic
            }
            
            savedComics = syncedComics
            print("Comics load ok ")
        }catch {
            print("Error to load comic: \(error)")
        }
    }
    
    @MainActor
    func searchOnStore() async {
        print(isLoading)
        guard !isLoading else { return }
        print(isLoading)
        self.isLoading = true
            do {
                let comicData = try await repository.searchOnStore(page: currentPage, text: searchTerm)
                comics += comicData
                print(comics.count)
            }catch {
                self.error = error
            }
        self.isLoading = false
    }
    
@MainActor
    func loadOrSearch(newValue: String) async {
        try? await Task.sleep(for: .seconds(2))
        if newValue != searchTerm { return }
        
        currentPage = 1
        count = 1
        comics.removeAll()
        
        if newValue.isEmpty {
            await loadComics()
        }else {
            await searchOnStore()
        }
    }
//    TODO: He de hacer que cargue lo de userDefault para que en estas 3 llamadas hagan lo mismo que para la llamada normal
    
    @MainActor
    func loadComicsByTheme(theme: String) async {
        guard !isLoading else { return }
        isFiltering = true
        currentFilter = .theme(theme)
        self.isLoading = true
        do {
            var comicData = try await repository.loadComicsByTheme(page: currentPage, text: theme)
            print("DataOK")
            for i in 0..<comicData.count {
                let comicID = comicData[i].id
                let isFavorit = UserDefaults.standard.bool(forKey: "isFavorit_\(comicID)")
                comicData[i].isFavorit = isFavorit
            }
            comics += comicData
            print(comics.count)
        }catch {
            self.error = error
        }
        self.isLoading = false
    }

    @MainActor
    func loadComicsByGenre(genre: String) async {
        guard !isLoading else { return }
        isFiltering = true
        currentFilter = .genre(genre)
        self.isLoading = true
        do {
            var comicData = try await repository.loadComicsByGenre(page: currentPage, text: genre)
            print("DataOK")
            for i in 0..<comicData.count {
                let comicID = comicData[i].id
                let isFavorit = UserDefaults.standard.bool(forKey: "isFavorit_\(comicID)")
                comicData[i].isFavorit = isFavorit
            }
            comics += comicData
            print(comics.count)
        }catch {
            self.error = error
        }
        self.isLoading = false
    }
    
    @MainActor
    func loadComicsByDemographic(demographic: String) async {
        guard !isLoading else { return }
        isFiltering = true
        currentFilter = .demographic(demographic)
        self.isLoading = true
        do {
            var comicData = try await repository.loadComicsByDemographic(page: currentPage, text: demographic)
            print("DataOK")
            for i in 0..<comicData.count {
                let comicID = comicData[i].id
                let isFavorit = UserDefaults.standard.bool(forKey: "isFavorit_\(comicID)")
                comicData[i].isFavorit = isFavorit
            }
            comics += comicData
            print(comics.count)
        }catch {
            self.error = error
        }
        self.isLoading = false
    }

    @MainActor
    func checkIsLastItem(comic: ComicModel) async  {
        guard !isLoading, let lastItem = comics.last else { return }
        if comic.id == lastItem.id {
            currentPage += 1
            count += 1
            print(count)
            if isFiltering, let filter = currentFilter {
                switch filter {
                case .theme(let theme):
                    await loadComicsByTheme(theme: theme)
                case .genre(let genre):
                    await loadComicsByGenre(genre: genre)
                case .demographic(let demographic):
                    await loadComicsByDemographic(demographic: demographic)
                }
            }else if searchTerm.isEmpty{
                await loadComics()
            }else {
                await searchOnStore()
            }
        }
        self.isLoading = false
    }
    
    @MainActor
    func resetToNormalValor() async {
        isFiltering = false
        searchTerm = ""
        currentPage = 1
        await loadComics()
    }
//    TODO: Acabar de pulir la funcion de guardado y borrado, los puedo guardar y borrar, pero no puedo ver cuales tengo o no guardados, ademas deberia de hacerlo creando un boton a parte para guardar y otro para saber si es favorito o no, el de guardar que los guarde y los favoritos mirar de hacerlo en ajustes de systema a ver. usar toggle para el favorito -DONE
    
  // funcion de descargar comics (comprar)
    func saveDataAndFavorite(_ comic: ComicModel,purchasedVolumes: Int, currentVolume: Int, isComplete: Bool, using modelContext: ModelContext) {
        do {
            // creo el JSON
            let comicData = ComicModelData(from: comic)
            print("Este es el id del comic: \(comicData.id)")
            
            //sincronizamos el isFavorit con los que tengo en user default
            let isFavorit = UserDefaults.standard.bool(forKey: "isFavorit_\(comicData.id)")
            comicData.isFavorit = isFavorit
            
            // lo añado al contexto y lo guardo
            modelContext.insert(comicData)
            UserDefaults.standard.set(purchasedVolumes, forKey: "purchasedVolumes_\(comic.id)")
            UserDefaults.standard.set(currentVolume, forKey: "currentVolume_\(comic.id)")
            UserDefaults.standard.set(isComplete, forKey: "isComplete_\(comic.id)")
            try modelContext.save()
            
        }catch {
            print("Error to save the comic: \(comic.id)")
            print(error)
        }
    }
        
    func deleteComic(at offsets: IndexSet, using modelContext: ModelContext) {
        offsets.forEach { index in
                    let comicToDelete = savedComics[index]
                    modelContext.delete(comicToDelete)
            
                    do {
                        try modelContext.save()
                        print("Comic eliminado: \(comicToDelete.id)")
                    } catch {
                        print("Error al eliminar el cómic: \(error)")
                    }
                }
    }
    // TODO: Revisar porque no entra desde el detail desde el vm, intento esforzarme antes de preguntar a chatgpt, se le pueden pedir pistas vale mas o menos voy por el camino, toca revisar como acabar de hacer esto- DONE
    
    @MainActor
    func toggleIsFavorit(for comic:  ComicModel, using modelContext: ModelContext)/*-> ComicModel*/ {
        if let index = comics.firstIndex(where: { $0.id == comic.id}) {
                comics[index].isFavorit.toggle()
            
//            Guardar en UserDefaults
                let comicID = comics[index].id
                UserDefaults.standard.set(comics[index].isFavorit, forKey: "isFavorit_\(comicID)")
            
//            Creo un if para ver si el comic esta o no en los guardados para asi pasarle la vista, para ello he de meter contexto a todo
            if let savedComic = savedComics.first(where: { $0.id == comicID}) {
                savedComic.isFavorit = comics[index].isFavorit
            } else{
                print("Comic no esta guardado")
            }
            do{
                try modelContext.save()
            }catch {
                print("Error al guardar: \(error)")
            }

        }
    }
}
