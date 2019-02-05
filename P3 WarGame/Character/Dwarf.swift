//
//  Dwarf.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class Dwarf: Character {
    init() {
        super.init(lifePoints: 80, characterName: "", weapon: Axe(), type: .dwarf)
    }
}
