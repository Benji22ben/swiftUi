//
//  LootItem.swift
//  swiftUi
//
//  Created by MARQUES BALULA Benjamin on 10/01/2024.
//

import Foundation

struct LootItem: Hashable, Identifiable {
    var id: UUID = UUID()
    var quantity : Int = 1
    var name : String
    var type : ItemType
    var rarity : Rarity
    var attackStrength : Int?
    var game : Game
}

enum ItemType: String {
    case magic = "⭐️", fire = "🔥", ice = "❄️", wind = "💨", poison = "☠️", thunder = "⚡️",dagger = "🗡️",shield = "🛡️",bow = "🏹",ring = "💍",unknown = "🎲"
}
