//
//  ContentView.swift
//  swiftUi
//
//  Created by MARQUES BALULA Benjamin on 10/01/2024.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(name: "Epoustouflante Sword", type: .magic, rarity: .uncommon, game: availableGames[0]),
        LootItem(quantity: 2, name: "Magnificient Bow", type: .bow, rarity: .rare, attackStrength: 15, game: availableGames[0])
    ]
    
//    func addItem(item: String) {
//        loot.append(item)
//    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()

    @State var addItemSheetPresented: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Button(action: {
//                    inventory.addItem(item: "Magie de feu")
                }, label: {
                    Text("Ajouter")
                })

                ForEach(inventory.loot) { item in
                    VStack (alignment: .leading) {
                        HStack {
                            HStack {
                                Circle().fill(item.rarity.getColor()).frame(width: 10)
                                Text(item.name)
                            }
                            Spacer()
                            Text(item.type.rawValue)
                        }
                        Text("Quantité : " + String(item.quantity))
                    }
                    
                }
            }.sheet(isPresented: $addItemSheetPresented, content: {
                AddItemView()
                    .environmentObject(inventory)
            }).navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            addItemSheetPresented.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}
