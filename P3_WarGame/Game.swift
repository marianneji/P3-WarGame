//
//  Game.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
/* The class game contains all the methods to introduce, initiate the players,
 and the fight.
 */
class Game {
    // array of players create by the func starGame()
    var player = [Player]()
    var round = 1
    
    /// function fight called in the main
    public func fight() {
        // while there is still at least one member in the team
        while !player[0].teamMembers.isEmpty && !player[1].teamMembers.isEmpty {
            // method to let the player select the characters and attack or heal
            fighter(attackingPlayer: player[0], defendingPlayer: player[1], round: round)
            // method to check if there's still a member in the teams and stop the game
            if checkWinner() {
                // the game stop if there's a winner
                break
            }
            // swap of the function with the parameters
            fighter(attackingPlayer: player[1], defendingPlayer: player[0], round: round)
            if checkWinner() {
                break
            }
            //increment a round for every loop
            round += 1
        }
    }
    /// func to choose character betweew the 2 teams to fight and select characters (attacking/defending)
    private func fighter(attackingPlayer: Player, defendingPlayer: Player, round: Int) {
        // constante to call the func bonusChest
        let chest = BonusChest()
        
        print("Round : \(round)")
        print("\(attackingPlayer.name) choose your team member who will fight or heal (if you choose the Mage):\n")
        // calling the function to show member of the attacking player
        displayTeamMembers(for: attackingPlayer)
        // constant for attacking player to select character/ calling the function selectCharacter
        let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
        // calling the bonus chest for the attacking player
        chest.bonusChest(character: chooseCharacter, round: round)
        // condition if the selected character is the mage
        if chooseCharacter is Mage {
            //calling the function for the condition if the mage is selected and the team is full life
            if teamsLifeIsFull(in: attackingPlayer) {
                // return to the beginning of the method in the actual round
                fighter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, round: round)
            } else {
                print("\(attackingPlayer.name) choose a team member to heal in your team\n")
                displayTeamMembers(for: attackingPlayer)
                // variable for attacking player to choose someone to heal
                var healCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                // condition if the selected character to heal is full life
                if healCharacter.lifePoints == healCharacter.maxLife {
                    print("""
                        The character cannot be healed, because he has the maximum ❤️: \(healCharacter.maxLife)
                        You can select someone else to heal.
                        
                        \(attackingPlayer.name) choose a team member to heal in your team
                        
                        """)
                    displayTeamMembers(for: attackingPlayer)
                    // return to the selection of the character to heal
                    healCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                    // condition if the healing exceed the max life
                } else if healCharacter.lifePoints + chooseCharacter.damage > healCharacter.maxLife {
                    healCharacter.lifePoints = healCharacter.maxLife
                    print("\(healCharacter.characterName) the \(healCharacter.type) has reached the max life: \(healCharacter.lifePoints) ❤️\n")
                }
                // calling the function heal
                chooseCharacter.heal(healCharacter)
            }
        } else {
            print("\(attackingPlayer.name) choose a team member of the opponent team to attack :\n")
            // calling the function to show member of the defending player
            displayTeamMembers(for: defendingPlayer)
            // constante to let the attacking player choose a member of the opponent team to fight/ calling the function selectCharacter
            let opponentCharacter = defendingPlayer.selectCharacter(player: defendingPlayer)
            // calling the function to attack
            chooseCharacter.attack(opponentCharacter)
            // calling the function to remove a member if the life reachs 0
            removeMember(character: opponentCharacter, player: defendingPlayer)
        }
    }
    /// remove a member if his life reachs 0
    private func removeMember(character: Character, player: Player) {
        //variable index to be able to remove the member at the index of the array
        var index = 0
        // condition if the member is dead
        if character.lifePoints == 0 {
            // loop in the teamMember
            for characterInTeam in player.teamMembers {
                // checking with the name of the character (because the name is unique) to remove the actual dead member
                if characterInTeam.characterName == character.characterName {
                    // removing the character at the index
                    player.teamMembers.remove(at: index)
                    print("""
                        Sorry for your loss, \(player.name)
                        💀💀💀 \(character.characterName) the \(character.type) has been buried ! 💀💀💀
                        
                        """)
                }
                // increment 1 at the index to change the position in the array after removing the member
                index += 1
            }
        }
    }
    /// func to check winners returns a bool: true the game stop/ false the game continue
    private func checkWinner() -> Bool {
        // check in each team if the mage is only
        checkIfMageIsOnly(for: 0)
        checkIfMageIsOnly(for: 1)
        // condition to stop the game if the total life points of the team is egual to 0
        if player[0].totalLifePoints == 0 {
            congratsWinner(for: 1)
            return true
        } else if player[1].totalLifePoints == 0 {
            congratsWinner(for: 0)
            return true
        }
        return false
    }
    /// function with the condition if the mage is the only member of the team and remove him if true (== 1)
    private func checkIfMageIsOnly(for index: Int) {
        // if there is only 1 member in the team
        if player[index].teamMembers.count == 1 {
            // and if this member is the mage
            if player[index].teamMembers[0] is Mage {
                // remove the mage at the index 0 because we are sure of the index if there is only one member
                player[index].teamMembers.remove(at: 0)
            }
        }
    }
    /// Method to show the winner with his team member alive
    private func congratsWinner(for index: Int) {
        print("""
                        ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️
            
                        ⭐️⭐️⭐️⭐️ \(player[index].name) has won the game in \(round) rounds ⭐️⭐️⭐️⭐️
            
                                            Special thanks to :
            
            """)
        displayTeamMembersAlive(for: index)
        print("""
            
                                         for this incredible fight
            
                                ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️
            
                                  THANKS FOR PLAYING, PLEASE RATE THIS APP 🤣
            
            """)
    }

    /// show all the team members before the selection
    private func displayTeamMembers(for player: Player) {
        // enumerates the characters of the team members and prints each character along with its place in the team members
        for (i, character) in player.teamMembers.enumerated() {
            print("\(i). \(character.characterName) the \(character.type): \(character.lifePoints) ♡ / \(character.weapon.weaponName): ⚔️ \(character.weapon.damage) / \(character.ability.abilityName): ⚔️ \(character.ability.damage), 🛡 \(character.ability.damageReceived).")
        }
    }
    /// show the members alive of the winner
    private func displayTeamMembersAlive(for index: Int) {
        // enumerates the characters of the team members and prints each character along with its place in the team members
        for (_, character) in player[index].teamMembers.enumerated() {
            print("""
                \(character.characterName) the \(character.type): \(character.lifePoints) ♡ / \(character.weapon.weaponName) / \(character.ability.abilityName),
                """)
        }
    }

    /// checking if the team have a full life so the player can't choose the mage
    private func teamsLifeIsFull(in player: Player) -> Bool {
        // condition maxLife == totalLifePoints return true
        if getMaxLifePoints(in: player.teamMembers) == player.totalLifePoints {
            print("All characters are full life, you can't choose the Mage.\n")
            return true
        } else {
            return false
        }
    }
    /// function with a get only property to return the maxLifePoints in the array of a team
    private func getMaxLifePoints(in team: [Character]) -> Int {
        var total = Int()
        
        for character in team {
            total += character.maxLife
        }
        return total
    }
    /// initiate players
    public func startGame() {
        //  range loop to create 2 players only
        for x in 0...1 {
            print("Player \(x + 1)")
            // constant players to call the function createPlayerName
            let players = Player(name: Player.createPlayerName())
            // the players will be append in the array of player
            player.append(players)
            // the players will create their teams
            players.chooseTeamCharacter()
        }
    }
    /// Intro of the game, rules and welcome
    static func gameInfos() {
        print("""
                                        ⚔️⚔️⚔️     Welcome In the WarGame    ⚔️⚔️⚔️
                            1. Name your team
                            2. Choose 3 characters (in the list below) to your team
                            3. Name each characters with a unique name
                            4. Pick one ability for each character that will increase his power
                            
                            The characters are :
                            The warrior : 100 ♡ life points, a sword with a ⚔️ damage of 10 points on the opponent ♡
                            The giant : 120 ♡ life points, a crossbow with a ⚔️ damage of 5 points on the opponent ♡
                            The dwarf : 80 ♡ life points, an axe with a ⚔️ damage of 20 points on the opponent ♡
                            The mage : 100 ♡ life points, he has a scepter to heal one of your team member, and gives back 20 ♡

                            You can attack the Mage, but he can't attack... he can only heal one of your member

                            If the Mage is the ONLY member in your team, you will loose the game.
                            
                            The abilities are :
                            Agility : Increase ⚔️ the damage of 10 points on the opponent ♡, and reduce 🛡 the damage received of 20 points
                            Endurance : Increase ⚔️ the damage of 15 points on the opponent ♡, and reduce 🛡 the damage received of 15 points
                            Strength : Increase ⚔️ the damage of 20 points on the opponent ♡, and reduce 🛡 the damage received of 10 points

                            The damage of the ability for the Mage will increase his capacity to heal

                            5. Choose a fighter and an opponent character, they will fight.
                            6. Your opponent will choose a fighter and one of your team member to attack, they will fight.

                            It will be the end of a round.

                            A chest might appear with new weapons on a random round, one of your character will be equipped with this new weapon
                            
                            It will goes like this till all of the members of one team will be dead

                                        ⚔️⚔️⚔️      So let's FIGHT till DEATH"    ⚔️⚔️⚔️

            """)
    }
}
