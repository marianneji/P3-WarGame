//
//  Warrior.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 01/02/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//



class Warrior: Character {
    init() {
        super.init(lifePoints: 100, characterName: "", weapon: Sword(), type: .warrior)
    }
}