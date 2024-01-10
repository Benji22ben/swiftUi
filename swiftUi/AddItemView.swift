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
