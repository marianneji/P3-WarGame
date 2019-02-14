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

/* this class initiate the team of player1 and player2
 and the character members.
 */

class Player {
    // propertie of player name
    var name: String
    // array of character members
    var teamMembers = [Character]()
    // static propertie of a collection of unique names
    static var uniqueName = [String]()
    // computed propertie for total life points of the team members
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
            case "2":
                print("The Giant is now in your team, \(name)" + "\n")
                // member is added to team
                character = Giant()
                teamMembers.append(character)
            case "3":
                print("The Dwarf is now in your team, \(name)" + "\n")
                // member is added to team
                character = Dwarf()
                teamMembers.append(character)
            case "4":
                print("The Mage is now in your team, \(name)" + "\n")
                // member is added to team
                character = Mage()
                teamMembers.append(character)
            default:
                print("Please choose a character for your team, \(name)" + "\n")
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
            if characterNameArray == names {
                print("this name is already taken, please choose a different name")
                return false
            }
        }
        Player.uniqueName.append(names)
        return true
    }
    
    func chooseAbility() {
        print("Choose an ability, it will apply for all the members of your team"  + "\n"
            + "\n1. Agility"
            + "\n2. Endurance"
            + "\n3. Strength")
        
        let choice = readLine()
        
        if choice == nil || (choice != "1" && choice != "2" && choice != "3") {
            print("Please choose a valid ability.")
            
            chooseAbility()
            return
            
        }
        let ability = AbilityType(rawValue: choice!)!
        print("The ability \(ability.type) has been added to your members")
        
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
                print("Invalid choice, please select a number in the list ABOVE.") //if number out of range, invalid choice
            }
            
        } while !player.teamMembers.indices.contains(choice) || chooseCharacter == nil // while player take an indice out of range, it loop
        
        return chooseCharacter!
    }
}
