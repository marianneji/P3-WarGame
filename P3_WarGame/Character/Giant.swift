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
        super.init(lifePoints: 120,maxLife: 150, characterName: Player.createCharacterName(), weapon: Crossbow(),type: .giant)
    }
}
