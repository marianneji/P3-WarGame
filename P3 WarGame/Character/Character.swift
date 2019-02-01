//
//  Character.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation


class Character {

    var lifePoints: Int
    var characterName: String
    var weapon: Weapon
    init(lifePoints: Int, characterName: String, weapon: Weapon) {
        self.lifePoints = lifePoints
        self.characterName = characterName
        self.weapon = weapon
    }
}







class Mage: Character {
    init() {
        super.init(lifePoints: 0, characterName: "T##String", weapon: Weapon(weaponName: "scepter", damage: 0, heal: 50))
    }
}
