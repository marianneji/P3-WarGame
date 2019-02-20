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
    // get-only computed property to obtain the ability damage with the weapon damage
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
    //
    init(lifePoints: Int,maxLife: Int, characterName: String, weapon: Weapon, type: CharacterType, ability: Ability) {
        self.lifePoints = lifePoints
        self.maxLife = maxLife
        self.characterName = characterName
        self.weapon = weapon
        self.type = type
        self.ability = ability
    }
    
    func attack(_ target: Character) {
        // cond to check that the ability does not give more life points
        if target.ability.damageReceived >= damage  {
            target.ability.damageReceived = damage
            // Infos of the attack if the cond above is true
            print("\n\(target.characterName) the \(target.type) has the ability \(target.ability.abilityName), he absorbs the damages caused :"
                + "\nThe attack has no effect, but he will not gain more ❤️. "
                + "\n\(target.characterName) have \(target.lifePoints) ❤️."
                + "\n")
        } else {
            // computed property to add the property, of the ability, damage received to the target
            var targetProtectionAbility: Int {
                get {
                    return target.lifePoints + target.ability.damageReceived
                }
                set {
                    target.lifePoints = newValue
                }
            }
            // substraction of the computed properties to obtain the new value of target life
            targetProtectionAbility -= damage
            if target.lifePoints <= 0 {
                print("\n💀💀💀\(target.characterName) the \(target.type) is dead !💀💀💀")
                target.lifePoints = 0
            }
            // Infos of the attack
            print("\n\(target.characterName) the \(target.type) has lost \(damage) ❤️ from:"
                + "\n\(weapon.damage) of the weapon damages and \(ability.damage) of the \(ability.type) damages."
                + "\n                          BUT.... Hahaha"
                + "\nwith his ability \(target.ability.abilityName), he has been protected of \(target.ability.damageReceived) points of damage received"
                + "\n\(target.characterName) the \(target.type) has \(target.lifePoints) ❤️🛡⚔️🧙🏻‍♂️ !"
                + "\n")
        }
    }
    func heal(_ member: Character) {
        if member.lifePoints == 0 {
            print("You can't heal a dead character")
        } else if member.lifePoints == member.maxLife {
            print("The character cannot be healed, because he has reached the maximum ❤️")
        } else {
            member.lifePoints += damage
            print("\(member.characterName) the \(member.type) has been restore his ❤️ with \(damage) points from :"
                + "\n\(weapon.damage) of the mage scepter and \(ability.damage) of the \(ability.type)"
                + "\n\(member.characterName) the \(member.type) has now \(member.lifePoints) ❤️")
        }
    }
}
