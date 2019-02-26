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
        self.init(lifePoints: 0, maxLife: 0, characterName: "", weapon: Weapon(weaponName: "", damage: 0, type: .Axe), type: .warrior, ability: Endurance())
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
                print("""
                    💀💀💀\(target.characterName) the \(target.type) is dead !💀💀💀
                    His ability \(target.ability.abilityName) was not strong enough to protect him from the \(damage) damages caused !
                    
                    """)
                target.lifePoints = 0
            } else {
            // Infos of the attack
            print("""
                \(target.characterName) the \(target.type) has lost \(damage) ❤️ from:
                \(weapon.damage) of the \(weapon.weaponName) damages and \(ability.damage) of the \(ability.type) damages.
                                          BUT.... Hahaha
                With his ability \(target.ability.abilityName), he has been protected of \(target.ability.damageReceived) pts
                \(target.characterName) the \(target.type) has \(target.lifePoints) ❤️🛡⚔️🧙🏻‍♂️ !
                
                """)
            }
        }
    }
    
    func heal(_ member: Character) {
        if (member.lifePoints + damage) > member.maxLife {
            member.lifePoints = member.maxLife
            //print("\(member.characterName) the \(member.type) has the maximum ❤️: \(member.lifePoints) pts\n")
            
        } else {
            member.lifePoints += damage
            print("\(member.characterName) the \(member.type) has been restore his ❤️ with \(damage) points from :"
                + "\n\(weapon.damage) of the mage scepter and \(ability.damage) of the \(ability.type)"
                + "\n\(member.characterName) the \(member.type) has now \(member.lifePoints) ❤️\n")
        }
    }
    
    func changeWeapon(character: Character) -> Weapon {
        let newWeapons = [
            Weapon(weaponName: "Bow", damage: Int.random(in: 20...35), type: .Crossbow),
            Weapon(weaponName: "Red Crossbow", damage: Int.random(in: 20...35), type: .Crossbow),
            Weapon(weaponName: "Magic Crossbow", damage: Int.random(in: 20...35), type: .Crossbow),
            Weapon(weaponName: "Longsword", damage: Int.random(in: 20...35), type: .Sword),
            Weapon(weaponName: "King Sword", damage: Int.random(in: 20...35), type: .Sword),
            Weapon(weaponName: "Sword of Fortune", damage: Int.random(in: 20...35), type: .Sword),
            Weapon(weaponName: "Battle Axe", damage: Int.random(in: 20...35), type: .Axe),
            Weapon(weaponName: "Red Axe", damage: Int.random(in: 20...35), type: .Axe),
            Weapon(weaponName: "Axe of Fury", damage: Int.random(in: 20...35), type: .Axe),
            Weapon(weaponName: "Magic Wand", damage: Int.random(in: 20...35), type: .Scepter),
            Weapon(weaponName: "Black Wand", damage: Int.random(in: 20...35), type: .Scepter),
            Weapon(weaponName: "Demon Scepter", damage: Int.random(in: 20...35), type: .Scepter),
        ]
        var randomWeapon = newWeapons.randomElement()
        while character.weapon.type != character.weapon.type || character.weapon.weaponName == randomWeapon?.weaponName {
            randomWeapon = newWeapons.randomElement()
            if character.weapon.type == randomWeapon?.type && character.weapon.weaponName != randomWeapon?.weaponName {
                character.weapon = randomWeapon!
            }
        }
        return randomWeapon!
    }
}
