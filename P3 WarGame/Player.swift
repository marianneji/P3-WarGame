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
  
    
    var team = [Character]()
    
    init(name: String) {
        self.name = name
        
    }

    
    static func createPlayerName() -> String { // return a name for a player
        print("What is the name of your player?")
        
        let name = input()
        
        
        if name == "" { // if name is not a string it will return to the function createplayername
            print("Please enter a valid name")
            return createPlayerName()
        }
        print("Your player name is \(name)")
        return name
        
    }
    
    func chooseCharacter() { // player has to choose 3 characters in the list
            
            repeat { // this menu will repeat while team members count is equal to 3
            print("Choose a character between those :"
            + "\n1. Warrior"
            + "\n2. Giant"
            + "\n3. Dwarf"
            + "\n4. Mage")
            
            let choice = readLine()
            switch choice {
            case "1":
                print("The warrior is now in your team, \(name)")
                let warrior = Warrior()
              team.append(warrior) // member is added to team
                
            case "2":
                print("The Giant is now in your team, \(name)")
                let giant = Giant()
                team.append(giant) // member is added to team
                
            case "3":
                print("The Dwarf is now in your team, \(name)")
                let dwarf = Dwarf()
                team.append(dwarf) // member is added to team
                
            case "4":
                print("The Mage is now in your team, \(name)")
                let mage = Mage()
                team.append(mage) // member is added to team
                
            default:
                print("Please choose a character for your team, \(name)")
                return chooseCharacter()
                
            }
            
    } while team.count < 3
        
 
}
    static func createCharacterName() {
        
    }
    // MARK: INCOMPLETE
    
    func chooseAbility() {
        print("Choose an abilty, it will apply for all the members of your team"
        + "\n1. Agility"
        + "\n2. Endurance"
        + "\n3. Strength")
        
        let choice = readLine() // imcomplet, il faut rajouter les propriétés et valeurs des abilités
        switch choice {
        case "1":
            print("The ability agility has been added to your members, \(name)")
          
    
            
            
        case "2":
            print("The ability Endurance has been added to your members, \(name)")
          
            
            
        case "3":
            print("The ability Strength has been added to your members, \(name)")
          
            
        default:
            print("Please choose an ability, \(name)")
            return chooseAbility()
    }

}

}
