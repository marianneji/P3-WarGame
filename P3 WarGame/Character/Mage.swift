//
//  Mage.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class Mage: Character {
    init() {
        super.init(lifePoints: 0, maxLife: 150, characterName: "", weapon: Scepter(), type: .mage)
    }
}
