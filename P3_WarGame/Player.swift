//
//  Player.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
/* this class initiate the team of player1 and player2,
 the character members and their abilities.
 */
class Player {
    // property of player name
    var name: String
    // array of character members
    var teamMembers = [Character]()
    // static property of a collection of unique names
    static var uniqueName = [String]()
    // computed property for total life points of the team members
    var totalLifePoints: Int {
        get {
            var sum = 0
            for character in teamMembers {
                sum += character.lifePoints
            }
            return sum
        }
        set {}
        
    }
    // init of the player name
    init(name: String) {
        self.name = name
    }
    // function to let player enter a name (string)
    static func input() -> String {
        let nameData = readLine()
        var nameIsInt : Bool {
            return Int(nameData!) != nil
        } // call the static func checkname to append it in the array of unique names
        let unique = Player.checkName(names: nameData!)
        
        if !unique || nameIsInt || nameData == "" {
            print("Please enter a valid name !")
            return input()
        } // we can force unwrapping nameData cause we are sure that it is not an Int and it is unique
        return nameData!.capitalized
    }
    // static function to create a player name
    static func createPlayerName() -> String {
        print("What is the name of your team ?")
        let name = Player.input()
        return name
    }
    // function to let player enter an Integer
    static func answerNumber() -> Int {
        let answerInt = readLine()
        // if let to unwrapped safely
        if let unwrappedAnswer = answerInt {
            if let answerNumber = Int(unwrappedAnswer) {
                return answerNumber
            } else {
                print("Please enter a number in the list")
            }
        }
        return answerNumber()
    }
    // player has to choose 3 characters in the list
    public func chooseTeamCharacter() {
        // this menu will repeat while team members count is equal to 3
        while teamMembers.count < 3 {
            print("""
                
                \(name) Choose a character between :
                1. Warrior: 100 ♡/ sword: 10 ⚔️
                2. Giant: 120 ♡/ Crossbow: 5 ⚔️
                3. Dwarf: 80 ♡/ Axe: 20 ⚔️
                4. Mage: 100 ♡/ Scepter: 20 ⚔️
                """)
            
            let choice = Player.answerNumber()
            var character: Character
            
            switch choice {
            case 1:
                print("The warrior is now in your team, \(name)\n")
                // member is added to team
                character = Warrior()
                teamMembers.append(character)
                chooseAbility(character: character)
            case 2:
                print("The Giant is now in your team, \(name)\n")
                // member is added to team
                character = Giant()
                teamMembers.append(character)
                chooseAbility(character: character)
            case 3:
                print("The Dwarf is now in your team, \(name)\n")
                // member is added to team
                character = Dwarf()
                teamMembers.append(character)
                chooseAbility(character: character)
            case 4:
                print("The Mage is now in your team, \(name)\n")
                // member is added to team
                character = Mage()
                teamMembers.append(character)
                chooseAbility(character: character)
            default:
                print("Invalid choice, please choose a character for your team, \(name)")
                return chooseTeamCharacter()
            }
        }
        // showing to the player his team members
        print("\nThere is your team : \(teamMembers)\n")
    }
    // static function to create a name for his team members...it will be called in the Characters subclass
    static func createCharacterName() -> String {
        print("Choose a name for your team member :")
        // constant asking player to enter a name
        let characterName = input()
        return characterName
    }
    // static function to check unique names return a bool
    static func checkName(names: String) -> Bool {
        for characterNameArray in Player.uniqueName {
            if characterNameArray.capitalized == names.capitalized {
                print("This name is already taken.")
                return false
            }
        }
        Player.uniqueName.append(names)
        return true
    }
    
    private func chooseAbility(character: Character) {
        print("""
            
            \(name) choose an ability, it will apply on your member \(character.characterName) the \(character.type)
            1. Agility, ⚔️: 10 ♡ / 🛡: 20 ♡
            2. Endurance, ⚔️: 20 ♡ / 🛡: 10 ♡
            3. Strength, ⚔️: 15 ♡ / 🛡: 15 ♡
            """)
        
        let choice = Player.answerNumber()
        switch choice {
        case 1:
            character.ability = Agility()
            print("\(name) The ability Agility has been added to your member \(character.characterName) the \(character.type)")
        case 2:
            character.ability = Endurance()
            print("\(name) The ability Endurance has been added to your member \(character.characterName) the \(character.type)")
        case 3:
            character.ability = Strength()
            print("\(name) The ability Strength has been added to your member \(character.characterName) the \(character.type)")
        default:
            print("This not a valid choice, please enter 1, 2 or 3.\n")
            chooseAbility(character: character)
        }
    }
    
    public func selectCharacter(player: Player) -> Character {
        // var choosecharacter of type character
        var chooseCharacter = Character()
        let choice = Player.answerNumber()
        
        switch choice {
        case 0:
            chooseCharacter = teamMembers[0]
            infosSelectCharacter(for: 0)
        case 1:
            if player.teamMembers.count == 1 {
                switch choice {
                case 0:
                    chooseCharacter = teamMembers[0]
                    infosSelectCharacter(for: 0)

                default:
                    print("You have only one member in your team.")
                    return selectCharacter(player: player)
                }
            }
            chooseCharacter = teamMembers[1]
            infosSelectCharacter(for: 1)
        case 2:
            if player.teamMembers.count == 2 {
                switch choice {
                case 0:
                    chooseCharacter = teamMembers[0]
                    infosSelectCharacter(for: 0)
                case 1:
                    chooseCharacter = teamMembers[1]
                    infosSelectCharacter(for: 1)
                default:
                    print("Choose a character in the list above.")
                    return selectCharacter(player: player)
                }
            }
            chooseCharacter = teamMembers[2]
            infosSelectCharacter(for: 2)
        default:
            print("Choose a character in the list above.")
            return selectCharacter(player: player)
        }
        
        return chooseCharacter
    }
    func infosSelectCharacter(for index: Int) {
        print("""
            You have chosen \(teamMembers[index].characterName) the \(teamMembers[index].type) - \(teamMembers[index].lifePoints) ♡/\(teamMembers[index].maxLife) max ♡ - \(teamMembers[index].weapon.weaponName): ⚔️ \(teamMembers[index].weapon.damage)
            \(teamMembers[index].ability.abilityName) ability: ⚔️ \(teamMembers[index].ability.damage)/ 🛡 \(teamMembers[index].ability.damageReceived)!\n
            """)
    }
}
