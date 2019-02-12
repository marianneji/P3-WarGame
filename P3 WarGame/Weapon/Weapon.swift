//
//  Weapons.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class Weapon {
    var weaponName: String
    var damage: Int
    var ability: Ability?
    
    
    init(weaponName: String, damage: Int) {
        self.weaponName = weaponName
        self.damage = damage
    }
    convenience init() {
        self.init(weaponName: "", damage: 0)
    }

}
