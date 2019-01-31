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
    var heal: Int
    
    init(weaponName: String, damage: Int, heal: Int) {
        self.weaponName = weaponName
        self.damage = damage
        self.heal = heal
    }
    
}

class Sword: Weapon {
    init() {
        super.init(weaponName: "sword", damage: 10, heal: 0)
    }
    
}
class Axe: Weapon {
    init() {
        super.init(weaponName: "axe", damage: 5, heal: 0)
    }
    
}
class Crossbow: Weapon {
    init() {
        super.init(weaponName: "crossbow", damage: 15, heal: 0)
    }
    
}
class Scepter: Weapon {
    init() {
        super.init(weaponName: "scepter", damage: 0, heal: 50)
    }
    
}
