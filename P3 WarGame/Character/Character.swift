//
//  Character.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

enum CharacterType: String { 
    case warrior, giant, dwarf, mage
}

class Character: CustomStringConvertible { // variable description utilisée pour transformer la classe en string
    var lifePoints: Int
    var characterName: String
    var weapon: Weapon
    var type: CharacterType
    var ability: Ability?
    
    var description: String {
        return type.rawValue
    }
    init(lifePoints: Int, characterName: String, weapon: Weapon, type: CharacterType) {
        self.lifePoints = lifePoints
        self.characterName = characterName
        self.weapon = weapon
        self.type = type
    }
    
    func addAbility() {
        
        
    }
 
}








