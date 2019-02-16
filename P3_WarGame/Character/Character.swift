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
    var ability: Ability
    var damage: Int {
        let totalDamage = weapon.damage + ability.damage
        return totalDamage
    }
    
    var description: String {
        return type.rawValue
    }
    convenience init() {
        self.init(lifePoints: 0, maxLife: 150, characterName: "", weapon: Weapon(weaponName: "", damage: 0), type: .warrior, ability: Endurance())
    }
    
    init(lifePoints: Int,maxLife: Int, characterName: String, weapon: Weapon, type: CharacterType, ability: Ability) {
        self.lifePoints = lifePoints
        self.maxLife = maxLife
        self.characterName = characterName
        self.weapon = weapon
        self.type = type
        self.ability = ability
    }
    
    func attack(_ target: Character) {
        var targetProtectionAbility: Int {
            get {
                return target.lifePoints + target.ability.damageReceived
            }
            set {
                target.lifePoints = newValue
            }
        }
        print("\(targetProtectionAbility) target protection ability")
        print("\(target.lifePoints) target life points")
        print("\(target.ability.damageReceived) target damage received")
        
            targetProtectionAbility -= damage
        

        print("\(target.characterName) has lost \(damage) points of life from:"
            + "\n\(weapon.damage) weapon damages and \(ability.damage) \(ability.type) damages"
            + "\n\(target.lifePoints) life  \(target.ability.damageReceived) damage received")
        if target.lifePoints < 0 {
            target.lifePoints = 0
        }
    }
}








