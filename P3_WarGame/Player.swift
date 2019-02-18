//
//  Player.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation

// function to let player enter a string (name)
func input() -> String {
    let nameData = readLine()
    return nameData!
}

// function to let player enter an Int (number)
func answer() -> Int {
    let answerInt = readLine()
    return Int(answerInt!)!
}

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
    // static function to create a player name
    static func createPlayerName() -> String {
        print("What is the name of your team ?" + "\n")
        let name = input()
        // if name is not a string it will return to the function createplayername
        if name == "" {
            print("Please enter a valid name")
            return createPlayerName()
        }
        return name
    }
    // player has to choose 3 characters in the list
    func chooseTeamCharacter() {
        // this menu will repeat while team members count is equal to 3
        while teamMembers.count < 3 {
            print("\(name) Choose a character between those :"
                + "\n1. Warrior"
                + "\n2. Giant"
                + "\n3. Dwarf"
                + "\n4. Mage")
            
            let choice = readLine()
            var character: Character
            
            switch choice {
            case "1":
                print("The warrior is now in your team, \(name)" + "\n")
                // member is added to team
                character = Warrior()
                teamMembers.append(character)
                chooseAbility(character: character)
            case "2":
                print("The Giant is now in your team, \(name)" + "\n")
                // member is added to team
                character = Giant()
                teamMembers.append(character)
                chooseAbility(character: character)
            case "3":
                print("The Dwarf is now in your team, \(name)" + "\n")
                // member is added to team
                character = Dwarf()
                teamMembers.append(character)
                chooseAbility(character: character)
            case "4":
                print("The Mage is now in your team, \(name)" + "\n")
                // member is added to team
                character = Mage()
                teamMembers.append(character)
                chooseAbility(character: character)
            default:
                print("Invalid choice, please choose a character for your team, \(name)" + "\n")
                return chooseTeamCharacter()
            }
        }
        // showing to the player his team members
        print("There is your team : \(teamMembers)" + "\n")
    }
    // static function to create a name for his team members...it will be called in the Characters subclass
    static func createCharacterName() -> String {
        print("Choose a name for your team member ")
        // constant asking player to enter a name
        let characterName = readLine()
        // call function checkname to check if the name is already in the array
        let aName = checkName(names: characterName!)
        // check if the name has been enter correctly
        if characterName == nil || characterName == "" || aName == false {
            return createCharacterName()
        }
        // return the name unwrapped
        return characterName!
    }
    // static function to check unique names return a bool
    static func checkName(names: String) -> Bool {
        for characterNameArray in Player.uniqueName {
            if characterNameArray.lowercased() == names.lowercased() {
                print("this name is already taken, please choose a different name")
                return false
            }
        }
        Player.uniqueName.append(names)
        return true
    }
    
    func chooseAbility(character: Character) {
        print("Choose an ability, it will apply on your member \(character.characterName) the \(character.type)"  + "\n"
            + "\n1. Agility, increase the damage by 5 points of life and reduce the damage received by 25 points of life "
            + "\n2. Endurance, increase the damage by 20 points of life and reduce the damage received by 10 points of life"
            + "\n3. Strength, increase the damage by 15 points of life and reduce the damage received by 15 points of life")
        
        let choice = readLine()
        switch choice {
        case "1":
            character.ability = Agility()
            print("The ability Agility has been added to your member \(character.characterName) the \(character.type)")
        case "2":
            character.ability = Endurance()
            print("The ability Endurance has been added to your member \(character.characterName) the \(character.type)")
        case "3":
            character.ability = Strength()
            print("The ability Strength has been added to your member \(character.characterName) the \(character.type)")
        default:
            print("This not a valid choice, please enter 1, 2 or 3"
            + "\n")
            chooseAbility(character: character)
        }
        
        /*if choice == nil || (choice != "1" && choice != "2" && choice != "3") {
            print("Please choose a valid ability.")
            
            return chooseAbility(character: Character())
        }
        let ability = AbilityType(rawValue: choice!)!
        print("The ability \(ability.type) has been added to your member")*/
    }
    
    func selectCharacter(player: Player) -> Character {
        
        var chooseCharacter: Character? = nil // var choosecharacter of type character
        
        var choice = 0 // initiate a variable int 
        
        repeat {
            choice = answer()
            // check if choice is in the index of team and if the life is > 0
            if player.teamMembers.indices.contains(choice) && player.teamMembers[choice].lifePoints > 0 {
                chooseCharacter = player.teamMembers[choice]
            } else {
                print("Invalid choice or the character you choose is dead, please select a number in the list ABOVE.") //if number out of range, invalid choice
            }
            
        } while !player.teamMembers.indices.contains(choice) || chooseCharacter == nil || (choice != 0 && choice != 1 && choice != 2)// while player take an indice out of range, it loop
        
        return chooseCharacter!
    }
}
