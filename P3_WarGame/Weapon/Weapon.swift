//
//  Weapons.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
enum WeaponType {
    case Sword, Crossbow, Axe, Scepter
}

class Weapon {
    var weaponName: String
    var damage: Int
    var type: WeaponType
    
    init(weaponName: String, damage: Int, type: WeaponType) {
        self.weaponName = weaponName
        self.damage = damage
        self.type = type
    }
    convenience init() {
        self.init(weaponName: "", damage: 0, type: .Axe)
    }
}
