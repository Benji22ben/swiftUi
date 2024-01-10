//
//  ContentView.swift
//  swiftUi
//
//  Created by MARQUES BALULA Benjamin on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var loot = ["Epée", "Bouclier", "Armure"]

    func addLoot() {
        loot.append("Magie de feu")
    }

    var body: some View {
        List {
            Button(action: {
                addLoot()
            }, label: {
                Text("Ajouter")
            })

            ForEach(loot, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    ContentView()
}
