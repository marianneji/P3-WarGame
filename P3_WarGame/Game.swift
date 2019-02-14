//
//  Game.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

class Game {
    
    var players = [Player]() // array of players
    
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
        for i in 0...1 { // i is a constante to incremente one player to the array of players
            print("Player \(i + 1)")
            
            let player = Player(name: Player.createPlayerName())
            players.append(player)
            
            player.chooseTeamCharacter()
            player.chooseAbility()
        }
        
        
    }
    
    func fight() {
        
        var round = 1
        var attackingPlayer = players[0]
        var defendingPlayer = players[1]
        
        // 
        while players[0].totalLifePoints != 0 && players[1].totalLifePoints != 0 {
            print("Round : \(round)")
            print("\(attackingPlayer.name) choose your team member who will fight :")
            
            for (i, character) in attackingPlayer.teamMembers.enumerated() {
                print("\(i) = \(character.characterName) as \(character.type) with \(character.lifePoints)")
                
            }
            let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
            print("\(attackingPlayer.name) choose a team member of the opponent team to attack :")
            
            for (i, character) in defendingPlayer.teamMembers.enumerated() {
                print("\(i) = \(character.characterName) as \(character.type) with \(character.lifePoints)")
                
            }
            
            let opponentCharacter = defendingPlayer.selectCharacter(player: defendingPlayer)
            
            chooseCharacter.attack(opponentCharacter)
            round += 1

            swap(&attackingPlayer, &defendingPlayer)
            
            if players[1].totalLifePoints == 0 {
                print("\(players[0].name) has won the game")
            } else if players[0].totalLifePoints == 0 {
                print("\(players[1].name) has won the game")
            }
            

        }
    }
    
}
