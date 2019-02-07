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

class Player {
    var name: String
    var teamMembers = [Character]() // array of character members

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
    
    func chooseCharacter() { // player has to choose 3 characters in the list
  
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
                let _ = createCharacterName()
                character = Warrior()
                teamMembers.append(character) // member is added to team
            case "2":
                print("The Giant is now in your team, \(name)" + "\n")
                let _ = createCharacterName()
                character = Giant()
                teamMembers.append(character) // member is added to team
            case "3":
                print("The Dwarf is now in your team, \(name)" + "\n")
                let _ = createCharacterName()
                character = Dwarf()
                teamMembers.append(character) // member is added to team
            case "4":
                print("The Mage is now in your team, \(name)" + "\n")
                let _ = createCharacterName()
                character = Mage()
                teamMembers.append(character) // member is added to team
            default:
                print("Please choose a character for your team, \(name)" + "\n")
                return chooseCharacter()
            }
        }
        print("There is your team : \(teamMembers)" + "\n")
    }
    
    func createCharacterName() -> String {
        print("Choose a name for your team member \(name)" + "\n")
        
        let characterName = readLine()
        
        if characterName == nil || characterName == "" {
            return createCharacterName()
            
        }
        return characterName!
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
}
