//
//  BonusChest.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class BonusChest {
    // array of new weapons of each different type
    let bonusWeapons = [
        Weapon(weaponName: "Fire Crossbow", damage: Int.random(in: 20...35), type: .Crossbow),
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
    /// func to get a new weapon for the selected character
    public func bonusChest(character: Character, round: Int) {
        // be sure that it's a random round
        guard round == Int.random(in: 1...40) else {
            return
        }
        // call the func switch weapon with a constant
        let newWeapon = switchWeapon(character: character)
        character.weapon = newWeapon
        
        print("""
            
            🎁🎁🎁🎁A chest has appeared in front of you with a new weapon much stronger inside🎁🎁🎁🎁
                            Now \(character.characterName) the \(character.type) is equipped with the new weapon \(newWeapon.weaponName): ⚔️ \(newWeapon.damage)
                                            ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️
            
            """)
    }
    /// func to switch weapon of the chosen character
    private func switchWeapon(character: Character) -> Weapon {
        // create a variable to shuffle the array of bonus weapons
        var randomWeapon = bonusWeapons.randomElement()
        // condition to be sure that the character will be equipped with a weapon of his type
        while randomWeapon?.type != character.weapon.type || character.weapon.weaponName == randomWeapon?.weaponName {
            randomWeapon = bonusWeapons.randomElement()
            
            if character.weapon.type == randomWeapon?.type && character.weapon.weaponName != randomWeapon?.weaponName {
                character.weapon = randomWeapon!
                return randomWeapon!
            }
        }
        // return forced unwrap weapon because we are sure that there are weapons with the right type in the array
        return randomWeapon!
    }
}

