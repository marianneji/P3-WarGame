//
//  Crossbow.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 05/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
// class Crossbow inherit from weapon
class Crossbow: Weapon {
    init() {
        super.init(weaponName: "Crossbow", damage: 5, type: .Crossbow)
    }
}
