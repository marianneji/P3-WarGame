//
//  BonusChest.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
/* class BonusChest contains an array of new weapons, the func bonusChest() and switchWeapon()
 called in the function fighter()*/

class BonusChest {
    // array of new weapons of each different weapon type
    let bonusWeapons = [
        Weapon(weaponName: "Fire Crossbow", damage: Int.random(in: 20...35), type: .Crossbow),
        Weapon(weaponName: "Red Crossbow", damage: Int.random(in: 20...35), type: .Crossbow),
        Weapon(weaponName: "Magic Crossbow", damage: Int.random(in: 20...35), type: .Crossbow),
        Weapon(weaponName: "Longsword", damage: Int.random(in: 20...35), type: .Sword),
        Weapon(weaponName: "King Sword", damage: Int.random(in: 20...35), type: .Sword),
        Weapon(weaponName: "Sword of Fortune", damage: Int.random(in: 20...35), type: .Sword),
        Weapon(weaponName: "Battle Axe", damage: Int.random(in: 21...35), type: .Axe),
        Weapon(weaponName: "Red Axe", damage: Int.random(in: 21...35), type: .Axe),
        Weapon(weaponName: "Axe of Fury", damage: Int.random(in: 21...35), type: .Axe),
        Weapon(weaponName: "Magic Wand", damage: Int.random(in: 20...35), type: .Scepter),
        Weapon(weaponName: "Black Wand", damage: Int.random(in: 20...35), type: .Scepter),
        Weapon(weaponName: "Demon Scepter", damage: Int.random(in: 20...35), type: .Scepter),
        ]
    
    /// func to switch weapon of the chosen character
    private func switchWeapon(character: Character) -> Weapon {
        
        // create a variable to shuffle the array of bonus weapons
        var randomWeapon = bonusWeapons.randomElement()
        
        // condition to be sure that the character will be equipped with a weapon of his type and not the same of the previous one
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
    
    /// func to get a new weapon for the selected character
    public func bonusChest(character: Character, round: Int) {
        //with the modulo we have 1 chance / 10 to get the bonus
        guard round % 10 == Int.random(in: 0...9) else {
            return
        }
        // call the func switch weapon with a constant
        let newWeapon = switchWeapon(character: character)
        character.weapon = newWeapon
        
        print("""
            
                        🎁🎁🎁🎁 A chest has appeared in front of you with a new weapon inside 🎁🎁🎁🎁
                                Now \(character.characterName) the \(character.type) is equipped with the \(newWeapon.weaponName): ⚔️ \(newWeapon.damage)
            
                                            ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️
            
            """)
    }
}

