//
//  ComicStoreView.swift
//  ComicDesk
//
//  Created by Victor Munera on 3/9/24.
//

import SwiftUI

struct ComicStoreView: View {
    @Environment(\.modelContext) var modelContext // esto ha de ir donde esta el boton
    
    @StateObject var viewmodel = ComicViewModel() // En esta vista debe de llamarse con este binding
    // TODO: 2 Crearme la preview test con el paginado de muestra y para comprobar el paginado bien abrir el simulador. Poder explicar bien el codigo - DONE
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewmodel.comics) { comic in
                    Section("ID: \(comic.id)") {
                                NavigationLink {
                                    ComicDetailView(vm: viewmodel, comic: comic) // Le paso el view model a la vista, tiene que ser en orden
                                } label: {
                                    ComicView(comic: comic)
                                }
                            }
                    .onAppear {
                        Task {
    //                        print("Aparecio el comic \(comic.id)")
                            await viewmodel.checkIsLastItem(comic: comic)
                        }
                    }
//                            // TODO: 1 Buscar una manera para llamar a vm.checkIsLastItem (comic) si el id es el mismo que el del ultimo elemento del array caargado de comics haremos un page += 1 y volvemos a llamar loadComics() - DONE
                }
            }
            .navigationTitle("Store")
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            //TODO: 3 search - DONE
            .searchable(text: $viewmodel.searchTerm,prompt: "Search comic")
            .onChange(of: viewmodel.searchTerm) {_, newValue in
                Task{
                    await viewmodel.loadOrSearch(newValue: newValue)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ComicsMenuView(viewmodel: viewmodel)
                }
            }
        }
        
    }
}

#Preview {
    // Asi solo me carga del test en el canva pero en simulador llama a BD
    ComicStoreView(viewmodel: ComicViewModel(repository: ComicListInteractorTest()))
}
