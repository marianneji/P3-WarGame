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
        var sum = 0
        for character in teamMembers {
           sum += character.lifePoints
        }
        return sum
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
    // function to let player enter an Int (number)
    static func answerNumber() -> Int {
        let answerInt = readLine()
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
    func chooseTeamCharacter() {
        // this menu will repeat while team members count is equal to 3
        while teamMembers.count < 3 {
            print("""
                
                \(name) Choose a character between :
                1. Warrior
                2. Giant
                3. Dwarf
                4. Mage
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
    
    func chooseAbility(character: Character) {
        print("Choose an ability, it will apply on your member \(character.characterName) the \(character.type)"  + "\n"
            + "\n1. Agility, increase the damage by 5 ❤️ and reduce the damage received by 25 ❤️ "
            + "\n2. Endurance, increase the damage by 20 ❤️ and reduce the damage received by 10 ❤️"
            + "\n3. Strength, increase the damage by 15 ❤️ and reduce the damage received by 15 ❤️")
        
        let choice = Player.answerNumber()
        switch choice {
        case 1:
            character.ability = Agility()
            print("The ability Agility has been added to your member \(character.characterName) the \(character.type)")
        case 2:
            character.ability = Endurance()
            print("The ability Endurance has been added to your member \(character.characterName) the \(character.type)")
        case 3:
            character.ability = Strength()
            print("The ability Strength has been added to your member \(character.characterName) the \(character.type)")
        default:
            print("This not a valid choice, please enter 1, 2 or 3"
            + "\n")
            chooseAbility(character: character)
        }
    }
    
    func selectCharacter(player: Player) -> Character {
        // var choosecharacter of type character
        var chooseCharacter: Character? = nil
        // initiate a variable int
        var choice = 0
        // Loop
        repeat {
            choice = Player.answerNumber()
            // check if choice is in the index of team and if the life is > 0
            if player.teamMembers.indices.contains(choice) && player.teamMembers[choice].lifePoints > 0 {
                chooseCharacter = player.teamMembers[choice]
            } else {
                //if number out of range, invalid choice
                print("Invalid choice or the character you choose is dead, please select a number in the list ABOVE.")
            }
            // while player take an indice out of range, it loop
        } while !player.teamMembers.indices.contains(choice) || chooseCharacter == nil
        return chooseCharacter!
    }
}
