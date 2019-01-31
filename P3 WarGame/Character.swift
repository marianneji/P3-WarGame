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
    init(lifePoints: Int) {
        self.lifePoints = lifePoints
    }
}

class Warrior: Character {
    let warrior = Warrior.init(lifePoints: 100)
}

class Giant: Character {
    let giant = Warrior.init(lifePoints: 120)
}

class Dwarf: Character {
    let dwarf = Warrior.init(lifePoints: 80)
}

class Mage: Character {
    let mage = Warrior.init(lifePoints: 0)
}
