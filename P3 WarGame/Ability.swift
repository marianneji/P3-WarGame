//
//  Ability.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation


class Ability {
    
    var weaponName: String
    var damage: Int
    var damageReceived: Int
    
    init(weaponName: String, damage: Int, damageReceived: Int) {
        self.weaponName = weaponName
        self.damage = damage
        self.damageReceived = damageReceived
    }
    func addAbilityToCharacter() {
        
    }
    
}
let agility = Ability(weaponName: "agility", damage: 0, damageReceived: -30)
let endurance = Ability(weaponName: "endurance", damage: 10, damageReceived: -10)
let strength = Ability(weaponName: "strength", damage: 15, damageReceived: -15)
