//
//  Dwarf.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
// class Dwarf inherit from Character
class Dwarf: Character {
    // We call the function Player.createCharacterName in the init, to create it at the moment that the player choose the character in his team
    init() {
        super.init(lifePoints: 80, maxLife: 80, characterName: Player.createCharacterName(), weapon: Axe(), type: .Dwarf, ability: Ability())
    }
}
