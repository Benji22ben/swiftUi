//
//  AddItemView.swift
//  swiftUi
//
//  Created by MARQUES BALULA Benjamin on 10/01/2024.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common, uncommon, rare, eic, legendary, unique
}

struct AddItemView: View {
    @State private name: String  ""
    @State private rarity: Rarity = .common
    
    var body: some View {
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", text: $rarity) {
                    ForEach(Rarity.allCases) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
        }
    }
}

#Preview {
    AddItemView()
}
