//
//  Ability.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation




class Ability {
    
    var abilityName: String
    var damage: Int
    var damageReceived: Int
    
    
    init(abilityName: String, damage: Int, damageReceived: Int) {
        self.abilityName = abilityName
        self.damage = damage
        self.damageReceived = damageReceived
    }
    convenience init() {
        self.init(abilityName: "", damage: 0, damageReceived: 0)
    }
}

