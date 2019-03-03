//
//  Weapons.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
// enum of weapon type useful for the function switchWeapon of the class BonusChest
enum WeaponType {
    case Sword, Crossbow, Axe, Scepter
}
// mother class of the weapons
class Weapon {
    var weaponName: String
    var damage: Int
    var type: WeaponType
    
    init(weaponName: String, damage: Int, type: WeaponType) {
        self.weaponName = weaponName
        self.damage = damage
        self.type = type
    }
    /* convenient to avoid iniate the weapon class when we have to call it,
     the type has been carefully chosen to match the convenient init of the character class,
     otherwise there was a conflict with the function switchWeapon */
    convenience init() {
        self.init(weaponName: "", damage: 0, type: .Sword)
    }
}
