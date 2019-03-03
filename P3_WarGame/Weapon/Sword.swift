//
//  Sword.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 05/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
// class sword inherit from weapon
class Sword: Weapon {
    init() {
        super.init(weaponName: "Sword", damage: 10, type: .Sword)
    }
}
