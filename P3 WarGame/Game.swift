//
//  Game.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class Game {
    
    
   static func gameInfos() { // Intro of the game, rules and welcome
        print("Welcome In the WarGame"
        + "\n First you'll have to name your team"
        + "\n Then, you'll have to choose 3 characters (in the list below) to your team"
        + "\n You will name each characters with a unique name"
        + "\n And pick one ability that will increase the power of all your team members"
        + "\n"
            + "\n The characters are :"
            + "\n The warrior : He Has 100 points of life, a sword with a damage of 10 points on the opponent life"
            + "\n The giant : He Has 120 points of life, a crossbow with a damage of 5 points on the opponent life"
            + "\n The dwarf : He Has 80 points of life, an axe with a damage of 20 points on the opponent life"
            + "\n The mage : Doesn't have points of life, but he has a scepter to heal one of your team member, and gives back 20 points of life"
        + "\n"
            + "\n The abilities are :"
            + "\n Agility : Doesn't increase the damage but reduce the damage received of 30 points of life"
            + "\n Endurance : Increase the damage of 10 points on the opponent life, and reduce the damage received of 20 points"
            + "\n Strength : Increase the damage of 15 points on the opponent life, and reduce the damage received of 15 points"
        + "\n"
        + "\n Then you'll choose a fighter and an opponent,"
        + "\n they will fight."
        + "\n Your opponent will choose a fighter and one of your team member to attack,"
        + "\n they will fight."
        + "\n It will be the end of a round."
        + "\n It will goes like this till all of the members of one team will be dead (except for the mage, he has no life, he's like a healing ghost)"
        + "\n So let's FIGHT till DEATH")
    }
    
    func startGame() { // 
        let name1 = Player.createPlayerName()
        print("Your team name is \(name1) player1" + "\n")
        let name2 = Player.createPlayerName()
        print("Your team name is \(name2) player2" + "\n")
        
        
        
        let player1 = Player(name: name1)
        let player2 = Player(name: name2)
        
        player1.chooseCharacter()
        player2.chooseCharacter()
        
        
        player1.chooseAbility()
        player2.chooseAbility()

    }
}
