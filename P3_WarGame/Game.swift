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
            + "\n And pick one ability that will increase the power of your character"
            + "\n"
            + "\n The characters are :"
            + "\n The warrior : He Has 100 ❤️, a sword with a damage of 10 points on the opponent ❤️"
            + "\n The giant : He Has 120 ❤️, a crossbow with a damage of 5 points on the opponent ❤️"
            + "\n The dwarf : He Has 80 ❤️, an axe with a damage of 20 points on the opponent ❤️"
            + "\n The mage : Doesn't have ❤️, but he has a scepter to heal one of your team member, and gives back 20 ❤️"
            + "\n"
            + "\n The abilities are :"
            + "\n Agility : Doesn't increase the damage but reduce the damage received of 30 ❤️"
            + "\n Endurance : Increase the damage of 10 points on the opponent ❤️, and reduce the damage received of 20 points"
            + "\n Strength : Increase the damage of 15 points on the opponent ❤️, and reduce the damage received of 15 points"
            + "\n"
            + "\n Then you'll choose a fighter and an opponent,"
            + "\n they will fight."
            + "\n Your opponent will choose a fighter and one of your team member to attack,"
            + "\n they will fight."
            + "\n It will be the end of a round."
            + "\n It will goes like this till all of the members of one team will be dead (except for the mage, he has no ❤️, he's like a healing ghost)"
            + "\n So let's FIGHT till DEATH"
            + "\n")
    }
    
    func startGame() {
        //  range loop to create only 2 players
        for x in 0...1 {
            print("Player \(x + 1)")
            
            let player = Player(name: Player.createPlayerName())
            players.append(player)
            
            player.chooseTeamCharacter()
        }
    }
    
    func fight() {
        
        var round = 1
        var attackingPlayer = players[0]
        var defendingPlayer = players[1]
        
        while players[0].totalLifePoints != 0 && players[1].totalLifePoints != 0 {
            print("Round : \(round)")
            print("\(attackingPlayer.name) choose your team member who will fight or heal (if you choose the Mage):"
                + "\n")
            // enumerates the characters of the team members and prints each character along with its place in the team members
            for (i, character) in attackingPlayer.teamMembers.enumerated() {
                print("\(i) = \(character.characterName) the \(character.type) with \(character.lifePoints) ❤️ and the ability \(character.ability.abilityName).")
            }
            let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
            
            if chooseCharacter is Mage {
                print("Choose a team member to heal in your team\n")
                // enumerates the characters of the team members and prints each character along with its place in the team members
                for (i, character) in attackingPlayer.teamMembers.enumerated() {
                    print("\(i) = \(character.characterName) the \(character.type) with \(character.lifePoints) ❤️ and the ability \(character.ability.abilityName).")
                }
                var healCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                while chooseCharacter.heal(healCharacter) != true {
                healCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                }
            } else {
                print("\(attackingPlayer.name) choose a team member of the opponent team to attack :"
                    + "\n")
                // enumerates the characters of the team members and prints each character along with its place in the team members
                for (i, character) in defendingPlayer.teamMembers.enumerated() {
                    print("\(i) = \(character.characterName) the \(character.type) with \(character.lifePoints) ❤️ and the ability \(character.ability.abilityName).")
                }
                
                let opponentCharacter = defendingPlayer.selectCharacter(player: defendingPlayer)
                
                chooseCharacter.attack(opponentCharacter)
            }
            round += 1
            
            swap(&attackingPlayer, &defendingPlayer)
            
            if players[1].totalLifePoints == 0 {
                print("\(players[0].name) has won the game in \(round) rounds")
            } else if players[0].totalLifePoints == 0 {
                print("\(players[1].name) has won the game in \(round) rounds")
            }
        }
    }
}
