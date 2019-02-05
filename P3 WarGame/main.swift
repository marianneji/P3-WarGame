//
//  main.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
let newGame = Game()
Game.gameInfos()

let name1 = Player.createPlayerName()
print("Your team name is \(name1) player1")
let name2 = Player.createPlayerName()
print("Your team name is \(name2) player2")


    
let player1 = Player(name: name1)
let player2 = Player(name: name2)

player1.chooseCharacter()
player2.chooseCharacter()


player1.chooseAbility()
player2.chooseAbility()
