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
        self.init(lifePoints: 0, maxLife: 0, characterName: "", weapon: Weapon(weaponName: "", damage: 0, type: .Sword), type: .warrior, ability: Endurance())
    }
    init(lifePoints: Int,maxLife: Int, characterName: String, weapon: Weapon, type: CharacterType, ability: Ability) {
        self.lifePoints = lifePoints
        self.maxLife = maxLife
        self.characterName = characterName
        self.weapon = weapon
        self.type = type
        self.ability = ability
    }
    /// function for the character to attack the opponent team
    func attack(_ target: Character) {
        /* cond to check that the ability does not give more life points
         if the damages are not strong enough */
        if target.ability.damageReceived >= damage  {
            target.ability.damageReceived = damage
            // Infos of the attack if the cond above is true
            print("""
                
                \(target.characterName) the \(target.type) has the ability \(target.ability.abilityName), he absorbs the \(damage) damages caused :"
                The attack has no effect, but he will not gain more life.
                \(target.characterName) still has \(target.lifePoints) ❤️.
                
                """)
        } else {
            // computed property to add the ability damage received to the target
            var targetProtectionAbility: Int {
                get {
                    return target.lifePoints + target.ability.damageReceived
                }
                set {
                    target.lifePoints = newValue
                }
            }
            // get only computed property to get the result of the attack for the print of the attack
            var resultOfTheAttack: Int {
                return damage - target.ability.damageReceived
            }
            // substraction of the computed properties to obtain the new value of target life
            targetProtectionAbility -= damage
            // condition if the character has more damage to his life
            if target.lifePoints <= 0 {
                print("""
                                        💀💀💀 \(target.characterName) the \(target.type) is dead ! 💀💀💀
                    His ability \(target.ability.abilityName) was not strong enough to protect him from the \(resultOfTheAttack) damages caused !
                    
                    """)
                target.lifePoints = 0
                
            } else {
                // Infos of the attack
                print("""
                    
                    \(target.characterName) the \(target.type) has lost \(resultOfTheAttack) ❤️ from:
                    \(weapon.damage) of the \(weapon.weaponName) damages and \(ability.damage) of the \(ability.type) damages.
                                                    BUT....
                    With his ability \(target.ability.abilityName), he has been protected of \(target.ability.damageReceived) pts
                    \(target.characterName) the \(target.type) have \(target.lifePoints) ❤️ !
                    
                    """)
            }
        }
    }
    /// function to heal character of the same team
    func heal(_ member: Character) {
        // condition not to exceed the character maxLife
        if (member.lifePoints + damage) > member.maxLife {
            member.lifePoints = member.maxLife
        } else {
            member.lifePoints += damage
            print("""
                
                \(member.characterName) the \(member.type) has been restore his ❤️ with \(damage) points from :
                \(weapon.damage) of the mage \(weapon.weaponName) and \(ability.damage) of the \(ability.type)
                \(member.characterName) the \(member.type) has now \(member.lifePoints) ❤️
                
                """)
        }
    }
    
}
