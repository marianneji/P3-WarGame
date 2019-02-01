//
//  Giant.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class Giant: Character {
    init() {
        super.init(lifePoints: 120, characterName: "", weapon: Weapon(weaponName: "crossbow", damage: 15, heal: 0))
    }
}
