//
//  Warrior.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class Warrior: Character {
    init() {
        super.init(lifePoints: 100, maxLife: 150, characterName: Player.createCharacterName() , weapon: Sword(), type: .warrior, ability: Ability())
    }
}
