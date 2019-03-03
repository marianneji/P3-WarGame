//
//  Mage.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
// class Mage inherit from Character
class Mage: Character {
    // We call the function Player.createCharacterName in the init, to create it at the moment that the player choose the character in his team
    init() {
        super.init(lifePoints: 100, maxLife: 100, characterName: Player.createCharacterName(), weapon: Scepter(), type: .Mage, ability: Ability())
    }
}
