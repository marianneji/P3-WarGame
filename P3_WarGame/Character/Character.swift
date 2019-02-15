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
    // instance of character class
    var lifePoints: Int 
    let maxLife: Int
    var characterName: String
    var weapon: Weapon
    var type: CharacterType
    
    
    var description: String {
        return type.rawValue
    }
    convenience init() {
        self.init(lifePoints: 0, maxLife: 150, characterName: "", weapon: Weapon(weaponName: "", damage: 0), type: .warrior)
    }
    
    init(lifePoints: Int,maxLife: Int, characterName: String, weapon: Weapon, type: CharacterType) {
        self.lifePoints = lifePoints
        self.maxLife = maxLife
        self.characterName = characterName
        self.weapon = weapon
        self.type = type
    }
    
    func attack(_ target: Character) {
        target.lifePoints -= weapon.damage
        print("\(target.characterName) has lost \(weapon.damage) points of life" + "\n")
        if target.lifePoints < 0 {
            target.lifePoints = 0
        }
    }
}








