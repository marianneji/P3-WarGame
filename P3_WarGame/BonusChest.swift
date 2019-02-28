//
//  BonusChest.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class BonusChest {
    /// func to get a new weapon for the selected character
    func bonusChest(character: Character, round: Int) {
        //
        guard round == Int.random(in: 1...40) else {
            
            return
        }
        let newWeapon = character.changeWeapon(character: character)
        character.weapon = newWeapon
        print("""
            
            ⚔️⚔️⚔️⚔️A chest with new weapons has appeared in front of you with a new weapon much stronger inside⚔️⚔️⚔️⚔️
            Now \(character.characterName) the \(character.type) is equipped with the new weapon \(newWeapon.weaponName): ⚔️ \(newWeapon.damage)
                                        ⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️⚔️
            
            """)
    }
}

