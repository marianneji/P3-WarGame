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
    var round = 1
    
    func fight() {
        while players[0].totalLifePoints != 0 && players[1].totalLifePoints != 0 {
            fighter()
            fighterSwap()
            
            round += 1
            checkWinner()
        }
    }
    
    func teamsLifeIsFull(in player: Player) -> Bool {
        if getMaxLifePoints(in: player.teamMembers) == player.totalLifePoints {
            fullLifeError()
            
            return true
        } else {
            return false
        }
    }
    
    private func getMaxLifePoints(in team: [Character]) -> Int {
        var total = Int()
        
        for character in team {
            total += character.maxLife
        }
        return total
    }
    
    private func fullLifeError() {
        print("All characters are full life, you can't choose the Mage.")
    }
    
    private func displayTeamMembers(for player: Player) {
        // enumerates the characters of the team members and prints each character along with its place in the team members
        for (i, character) in player.teamMembers.enumerated() {
            print("\(i) = \(character.characterName) the \(character.type) with \(character.lifePoints) ❤️ and the ability \(character.ability.abilityName).")
        }
    }
    func bonusChest(character: Character) {
        
        print("A chest with new weapons has appeared in front of you with a new weapon much stronger inside")
        let newWeapon = character.changeWeapon(character: character)
        character.weapon = newWeapon
        print("Now \(character.characterName) the \(character.type) is equiped with the new weapon \(newWeapon.weaponName)")
        
    }
    
    func fighter() {
        let attackingPlayer = players[0]
        let defendingPlayer = players[1]
        print("Round : \(round)")
        print("\(attackingPlayer.name) choose your team member who will fight or heal (if you choose the Mage):\n")
        displayTeamMembers(for: attackingPlayer)
        
        let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
        if chooseCharacter is Mage {
            if teamsLifeIsFull(in: attackingPlayer) {
                fighter()
            } else {
                print("Choose a team member to heal in your team\n")
                displayTeamMembers(for: attackingPlayer)
                let healCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                
                if healCharacter.lifePoints == healCharacter.maxLife {
                    print("The character cannot be healed, because he has the maximum ❤️\n")
                    fighter()
                } else if healCharacter.lifePoints == 0 {
                    print("You can't heal a dead character")
                    fighter()
                    
                } else if healCharacter.lifePoints + chooseCharacter.damage > healCharacter.maxLife {
                    healCharacter.lifePoints = healCharacter.maxLife
                    print("\(healCharacter.characterName) has reached the max life: \(healCharacter.lifePoints) pts\n")
                }
                chooseCharacter.heal(healCharacter)
            }
        } else {
            print("\(attackingPlayer.name) choose a team member of the opponent team to attack :\n")
            displayTeamMembers(for: defendingPlayer)
            
            let opponentCharacter = defendingPlayer.selectCharacter(player: defendingPlayer)
            
            chooseCharacter.attack(opponentCharacter)
        }
    }

    func fighterSwap() {
        let attackingPlayer = players[1]
        let defendingPlayer = players[0]
        print("Round : \(round)")
        print("\(attackingPlayer.name) choose your team member who will fight or heal (if you choose the Mage):\n")
        
        displayTeamMembers(for: attackingPlayer)
        
        let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
        if chooseCharacter is Mage {
            if teamsLifeIsFull(in: attackingPlayer) {
                fighterSwap()
            } else {
                print("Choose a team member to heal in your team\n")
                displayTeamMembers(for: attackingPlayer)
                let healCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                
                if healCharacter.lifePoints == healCharacter.maxLife {
                    print("The character cannot be healed, because he has the maximum ❤️\n")
                    fighterSwap()
                } else if healCharacter.lifePoints == 0 {
                    print("You can't heal a dead character")
                    fighterSwap()
                    
                } else if healCharacter.lifePoints + chooseCharacter.damage > healCharacter.maxLife {
                    healCharacter.lifePoints = healCharacter.maxLife
                    print("\(healCharacter.characterName) has reached the max life: \(healCharacter.lifePoints) pts\n")
                }
                chooseCharacter.heal(healCharacter)
            }
        } else {
            print("\(attackingPlayer.name) choose a team member of the opponent team to attack :\n")
            displayTeamMembers(for: defendingPlayer)
            
            let opponentCharacter = defendingPlayer.selectCharacter(player: defendingPlayer)
            
            chooseCharacter.attack(opponentCharacter)
        }
        
    }
    private func checkWinner() {
        checkIfMageIsOnly(for: 1)
        checkIfMageIsOnly(for: 2)
        if players[1].totalLifePoints == 0 {
            displayRounds(for: 0)
        } else if players[0].totalLifePoints == 0 {
            displayRounds(for: 1)
        }
    }
    
    private func displayRounds(for playerIndex: Int) {
        print("\(players[playerIndex].name) has won the game in \(round) rounds")
    }

    
    private func checkIfMageIsOnly(for playerIndex: Int) {
        for character in players[1].teamMembers {
            if ((character is Warrior && character.lifePoints == 0) && (character is Giant && character.lifePoints == 0) && (character is Dwarf && character.lifePoints == 0)) && (character is Mage && character.lifePoints != 0) {
                players[1].totalLifePoints = 0
            }
        }
        for character in players[0].teamMembers {
            if ((character is Warrior && character.lifePoints == 0) && (character is Giant && character.lifePoints == 0) && (character is Dwarf && character.lifePoints == 0)) && (character is Mage && character.lifePoints != 0) {
                players[0].totalLifePoints = 0
            }
        }
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
    static func gameInfos() { // Intro of the game, rules and welcome
        print("""
                               ⚔️⚔️⚔️     Welcome In the WarGame    ⚔️⚔️⚔️
            First you'll have to name your team
            Then, you'll have to choose 3 characters (in the list below) to your team
            You will name each characters with a unique name"
            And pick one ability that will increase the power of your character
            
            The characters are :
            The warrior : He Has 100 ❤️, a sword with a damage of 10 points on the opponent ❤️
            The giant : He Has 120 ❤️, a crossbow with a damage of 5 points on the opponent ❤️
            The dwarf : He Has 80 ❤️, an axe with a damage of 20 points on the opponent ❤️
            The mage : Doesn't have ❤️, but he has a scepter to heal one of your team member, and gives back 20 ❤️
            
            The abilities are :
            Agility : Doesn't increase the damage but reduce the damage received of 30 ❤️
            Endurance : Increase the damage of 10 points on the opponent ❤️, and reduce the damage received of 20 points
            Strength : Increase the damage of 15 points on the opponent ❤️, and reduce the damage received of 15 points
            
            Then you'll choose a fighter and an opponent,
            they will fight.
            Your opponent will choose a fighter and one of your team member to attack,
            they will fight.
            It will be the end of a round.
            It will goes like this till all of the members of one team will be dead
                                  ⚔️⚔️⚔️      So let's FIGHT till DEATH"    ⚔️⚔️⚔️

            """)
    }
}
