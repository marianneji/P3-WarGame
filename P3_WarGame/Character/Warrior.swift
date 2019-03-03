//
//  Warrior.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
// class Warrior inherit from Character
class Warrior: Character {
    // We call the function Player.createCharacterName in the init, to create it at the moment that the player choose the character in his team
    init() {
        super.init(lifePoints: 100, maxLife: 100, characterName: Player.createCharacterName() , weapon: Sword(), type: .Warrior, ability: Ability())
    }
}
