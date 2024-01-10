//
//  AddItemView.swift
//  swiftUi
//
//  Created by MARQUES BALULA Benjamin on 10/01/2024.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common, uncommon, rare, epic, legendary, unique;
    
    func getColor() -> Color{
        
        switch(self){
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.yellow
        case .unique:
            return Color.red
        }
    }
}

struct AddItemView: View {
    @State var name: String = ""
    @State var rarity: Rarity = .common
    @State var game: Game = availableGames[0]
    @State var quantity: Int = 1
    @State var type: ItemType = .unknown
    @State var isAttack: Bool = false
    
    func incrementStep() {
        quantity += 1
    }


    func decrementStep() {
        quantity -= 1
    }
    

    
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $game) {
                    ForEach(availableGames, id: \.self) {game in
                        Text(game.name)
                    }
                }
                Stepper {
                    HStack {
                        Text("Quantité ")
                        Spacer()
                        Text(String(quantity))
                    }

                } onIncrement: {
                    incrementStep()
                } onDecrement: {
                    decrementStep()
                }
            }
            Section {
                HStack {
                    Text("Type")
                    Spacer()
                    Text(type.rawValue)
                }
                Picker("Type", selection: $type) {
                    ForEach(ItemType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }.pickerStyle(.palette)
            }
            Section {
                HStack {
                    Text("Item d'attaque ?")
                    Spacer()
                    Toggle("", isOn: $isAttack)
                }
                
            }
            Button(action: {
//                inventory.addItem(item: name) // L'action de notre bouton
                dismiss()
            }, label: {
                    Image(systemName: "plus.circle.fill")
                    Text("Ajouter")
            })
        }
    }
}

#Preview {
    AddItemView()
}
