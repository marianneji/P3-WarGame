//
//  Player.swift
//  P3 WarGame
//
//  Created by Graphic Influence on 29/01/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import Foundation
/* this class initiate the team of player1 and player2
 and the character members.
 */
func input() -> String { // fonction permettant aux joueur de rentrer le nom choisi
    let nameData = readLine()
    
    return nameData!
}

func answer() -> Int {
    let answerInt = readLine()
    
    return Int(answerInt!)!
}

class Player {
    var name: String
    var teamMembers = [Character]() // array of character members
    static var uniqueName = [String]()

        init(name: String) {
        self.name = name
    }
    
    static func createPlayerName() -> String { // return a name for a player
        print("What is the name of your team ?" + "\n")
        
        let name = input()
        
        
        if name == "" { // if name is not a string it will return to the function createplayername
            print("Please enter a valid name")
            return createPlayerName()
        }
        
        return name

    }
    
    func chooseTeamCharacter() { // player has to choose 3 characters in the list
  
        while teamMembers.count < 3 { // this menu will repeat while team members count is equal to 3
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
                
                character = Warrior()
                teamMembers.append(character) // member is added to team
                
            case "2":
                print("The Giant is now in your team, \(name)" + "\n")
                
                character = Giant()
                teamMembers.append(character) // member is added to team
            case "3":
                print("The Dwarf is now in your team, \(name)" + "\n")
                
                character = Dwarf()
                teamMembers.append(character) // member is added to team
            case "4":
                print("The Mage is now in your team, \(name)" + "\n")
                
                character = Mage()
                teamMembers.append(character) // member is added to team
            default:
                print("Please choose a character for your team, \(name)" + "\n")
                return chooseTeamCharacter()
            }
        }
        print("There is your team : \(teamMembers)" + "\n")
    }
    
    static func createCharacterName() -> String {
        print("Choose a name for your team member ")
        
        let characterName = readLine()
        
        let aName = checkName(names: characterName!)
        
        if characterName == nil || characterName == "" || aName == false {
            return createCharacterName()
            
        }
        return characterName!
    
    }
    
    static func checkName(names: String) -> Bool {

        for characterNameArray in Player.uniqueName {
            if characterNameArray == names {
                print("this name is already taken, please choose a diferent name")
                return false
            }
        }
        Player.uniqueName.append(names)
        return true
    }

    func chooseAbility() {
        print("Choose an abilty \(name), it will apply for all the members of your team"  + "\n"
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
        print("The ability \(ability.type) has been added to your members, \(name)")
     }
    
    func selectCharacter(player: Player) -> Character {
        
        var chooseCharacter = Character()
        
        var choice = 0 // initiate a variable int 
        
        repeat {
            choice = answer()
            
            if player.teamMembers.indices.contains(choice) {
            chooseCharacter = player.teamMembers[choice]
        } else {
            print("Invalid choice, please select a number in the list ABOVE.")
        }
        
    } while !player.teamMembers.indices.contains(choice)
        
        return chooseCharacter
    }
}
