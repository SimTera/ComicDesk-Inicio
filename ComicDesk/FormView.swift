//
//  FormView.swift
//  ComicDesk
//
//  Created by Victor Munera on 28/9/24.
//

import SwiftUI

struct FormView: View {
    var comic: ComicModel
    @ObservedObject var vm: ComicViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext
    
    @State var purchasedVolumes: Int = 0
    @State var currentVolume: Int = 0
    @State var chapters: Int?
    @State var isComplete: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Stepper(value:$purchasedVolumes, in: 0...(comic.volumes ?? 1 )) {
                        Text("Tomos comprados: \(purchasedVolumes)")
                    }
                    if purchasedVolumes > 0 {
                        Stepper(value: $currentVolume, in: 1...purchasedVolumes) {
                            Text("Tomo por el que va leyendo: \(currentVolume)")
                        }
                    }
                    Toggle(isOn: Binding(
                        get: { purchasedVolumes == (comic.volumes ?? 0) },
                        set: { _ in }
                    )) {
                        HStack {
                            Text("Colección completa")
                        }
                    }
                }header: {
                    Text("Colección del cómic")
                }
            }
            .navigationBarTitle("Gestionar colección", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Guardar") {
                    vm.saveDataAndFavorite(comic, purchasedVolumes: purchasedVolumes, currentVolume: currentVolume, isComplete: isComplete, using: modelContext)
                    presentationMode.wrappedValue.dismiss()
                })
        }
    }
}
