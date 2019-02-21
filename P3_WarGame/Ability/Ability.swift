//
//  Ability.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation


enum AbilityType: String {
    case agility, endurance, strength

    var type: String {// variable calculée 
        switch self {
        case .agility:
            return "agility"
        case .endurance:
            return "endurance"
        case .strength:
            return "strength"
        }
    }
}

class Ability {
    
    var abilityName: String
    var damage: Int
    var damageReceived: Int
    var type: AbilityType
    
    init(abilityName: String, damage: Int, damageReceived: Int, type: AbilityType) {
        self.abilityName = abilityName
        self.damage = damage
        self.damageReceived = damageReceived
        self.type = type
    }
    convenience init() {
        self.init(abilityName: "", damage: 0, damageReceived: 0, type: .agility)
    }
}

