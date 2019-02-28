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
    
    public func fight() {
        //while players[0].totalLifePoints != 0 && players[1].totalLifePoints != 0 {
        while !players[0].teamMembers.isEmpty && !players[1].teamMembers.isEmpty {
            fighter(attackingPlayer: players[0], defendingPlayer: players[1], round: round)
            if checkWinner() {
                break
            }
            fighter(attackingPlayer: players[1], defendingPlayer: players[0], round: round)
            if checkWinner() {
                break
            }
            round += 1
        }
    }
    
    private func checkWinner() -> Bool {
        checkIfMageIsOnly(for: 0)
        checkIfMageIsOnly(for: 1)
        if players[0].totalLifePoints == 0 {
            print("\(players[1].name) has won the game in \(round) rounds\n")
            return true
        } else if players[1].totalLifePoints == 0 {
            print("\(players[0].name) has won the game in \(round) rounds\n")
            return true
        }
        return false
    }
    
    private func fighter(attackingPlayer: Player, defendingPlayer: Player, round: Int) {
        let chest = BonusChest()
        
        print("Round : \(round)")
        print("\(attackingPlayer.name) choose your team member who will fight or heal (if you choose the Mage):\n")
        displayTeamMembers(for: attackingPlayer)
        
        let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
        chest.bonusChest(character: chooseCharacter, round: 1)
        if chooseCharacter is Mage {
            if teamsLifeIsFull(in: attackingPlayer) {
                fighter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, round: round)
            } else {
                print("Choose a team member to heal in your team\n")
                displayTeamMembers(for: attackingPlayer)
                let healCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                
                if healCharacter.lifePoints == healCharacter.maxLife {
                    print("The character cannot be healed, because he has the maximum ♡\n")
                    fighter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, round: round)
                } else if healCharacter.lifePoints == 0 {
                    print("You can't heal a dead character")
                    fighter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, round: round)
                    
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
            
            removeMember(character: opponentCharacter, player: defendingPlayer)
        }
        
    }
    
    private func removeMember(character: Character, player: Player) {
        var index = 0
        if character.lifePoints == 0 {
            for characterInTeam in player.teamMembers {
                if characterInTeam.characterName == character.characterName {
                    player.teamMembers.remove(at: index)
                    print("\(character.characterName) has been remove from \(player.name) team!!")
                }
                index += 1
            }
        }
    }
    
    private func checkIfMageIsOnly(for index: Int) {
        if players[index].teamMembers.count == 1 {
            if players[index].teamMembers[0] is Mage {
                players[index].teamMembers.remove(at: 0)
            }
        }
    }
    
    private func teamsLifeIsFull(in player: Player) -> Bool {
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
        print("All characters are full life, you can't choose the Mage.\n")
    }
    
    private func displayTeamMembers(for player: Player) {
        // enumerates the characters of the team members and prints each character along with its place in the team members
        for (i, character) in player.teamMembers.enumerated() {
            print("\(i) = \(character.characterName) the \(character.type) with \(character.lifePoints) ♡ and the ability \(character.ability.abilityName).")
        }
    }
    
    ///
    public func startGame() {
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
                            1. Name your team
                            2. Choose 3 characters (in the list below) to your team
                            3. Name each characters with a unique name
                            4. Pick one ability that will increase the power of your character
                            
                            The characters are :
                            The warrior : 100 ♡ life points, a sword with a ⚔️ damage of 10 points on the opponent ♡
                            The giant : 120 ♡ life points, a crossbow with a ⚔️ damage of 5 points on the opponent ♡
                            The dwarf : 80 ♡ life points, an axe with a ⚔️ damage of 20 points on the opponent ♡
                            The mage : 100 ♡ life points, he has a scepter to heal one of your team member, and gives back 20 ♡

                            You can attack the Mage, but he can't attack... he can only heal one of your member
                            If the Mage is the only member in your team, you will loose the game.
                            
                            The abilities are :
                            Agility : Increase ⚔️ the damage of 10 points on the opponent ♡, and reduce 🛡 the damage received of 20 points
                            Endurance : Increase ⚔️ the damage of 20 points on the opponent ♡, and reduce 🛡 the damage received of 10 points
                            Strength : Increase ⚔️ the damage of 15 points on the opponent ♡, and reduce 🛡 the damage received of 15 points

                            The damage of the ability for the Mage will increase his capacity to heal

                            5. Choose a fighter and an opponent character, they will fight.
                            6. Your opponent will choose a fighter and one of your team member to attack, they will fight.

                            It will be the end of a round.

                            A chest will appear with new weapons on a random round, one of your character will be equipped with this new weapon
                            
                            It will goes like this till all of the members of one team will be dead

                                        ⚔️⚔️⚔️      So let's FIGHT till DEATH"    ⚔️⚔️⚔️

            """)
    }
}
