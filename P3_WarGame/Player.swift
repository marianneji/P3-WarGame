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
        // returning an Int of nameData unnil as true, to put it in the condition of invalid name
        var nameIsInt : Bool {
            return Int(nameData!) != nil
        } // call with the constant unique, the static func checkName to append nameData in the array of unique names
        let unique = Player.checkName(names: nameData!)
        // if the name do not fill the cond of the function checkNames or is an integer or is empty
        if !unique || nameIsInt || nameData == "" {
            print("Please enter a valid name !")
            return input()
        } // we can force unwrapping nameData cause we are sure that it is not an Int, it is unique or not empty
        return nameData!.capitalized
    }
    
    // static function to create a player name
    static func createPlayerName() -> String {
        print("What is the name of your team ?")
        let name = Player.input()
        return name
    }
    
    // function to let player enter an Integer
    static func answerNumber() -> Int? {
        /* readLine() returns an optional string by default, so we ask the func to return an optional Int
         we create in the guard 2 constants, answerInt convert answerNumb in Int
         if it's not possible it will return nil otherwise return an optional Int */
        guard let answerNumb = readLine(), let answerInt = Int(answerNumb) else {
           print("Please enter a number in the list")
            return nil
        }
        return answerInt
    }
    
    // player has to choose 3 characters in the list
    public func chooseTeamCharacter() {
        // this menu will repeat till team members count is equal to 3
        while teamMembers.count < 3 {
            print("""
                
                \(name) Choose a character between :
                1. Warrior: 100 ♡/ sword: 10 ⚔️
                2. Giant: 120 ♡/ Crossbow: 5 ⚔️
                3. Dwarf: 80 ♡/ Axe: 20 ⚔️
                4. Mage: 100 ♡/ Scepter: 20 ⚔️
                """)
            // calling the static function answerNumber to let player enter a choice, no need to unwrap because we are in a switch statement
            let choice = Player.answerNumber()
            // variable character of type Character
            var character: Character
            
            switch choice {
            case 1:
                print("The Warrior is now in your team, \(name)\n")
                // giving a value to character
                character = Warrior()
                // the value of character = Warrior is added to team
                teamMembers.append(character)
                // Ability is added to the actual character
                chooseAbility(character: character)
            case 2:
                print("The Giant is now in your team, \(name)\n")
                character = Giant()
                // Giant is added to team
                teamMembers.append(character)
                // Ability is added to the character
                chooseAbility(character: character)
            case 3:
                print("The Dwarf is now in your team, \(name)\n")
                character = Dwarf()
                // Dwarf is added to team
                teamMembers.append(character)
                // Ability is added to the character
                chooseAbility(character: character)
            case 4:
                print("The Mage is now in your team, \(name)\n")
                character = Mage()
                // Mage is added to team
                teamMembers.append(character)
                // Ability is added to the character
                chooseAbility(character: character)
            default:
                print("Invalid choice, please choose a character for your team, \(name)")
                return chooseTeamCharacter()
            }
        }
        // showing to the player his team members
        showTeamMembers()
    }
    
    //  func to show at the player his team members
    private func showTeamMembers() {
        print("""
            
                                    ⭐️⭐️⭐️⭐️ There is your team, \(name) ⭐️⭐️⭐️⭐️
            
                                    \(teamMembers[0].characterName) the \(teamMembers[0].type), \(teamMembers[1].characterName) the \(teamMembers[1].type), \(teamMembers[2].characterName) the \(teamMembers[2].type)
            
                                            ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️
            
            """)
        
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
    
    /// function to add ability to character, called in chooseTeamCharacter just after the character is append in the array of teamMembers
    private func chooseAbility(character: Character) {
        print("""
            
            \(name) choose an ability wisely, it will apply on your member \(character.characterName) the \(character.type)
            1. Agility, ⚔️: 10 ♡ / 🛡: 20 ♡
            2. Endurance, ⚔️: 15 ♡ / 🛡: 15 ♡
            3. Strength, ⚔️: 20 ♡ / 🛡: 10 ♡
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
    
    /// function to select a character as attacking as defending in the function fighter()
    public func selectCharacter(player: Player) -> Character {
        // var choosecharacter has a value character
        var chooseCharacter = Character()
        
        // call the static func answerNumber() to let player enter a choice
        let choice = Player.answerNumber()
        // we unwrap safely the choice, if unwrapChoice is contained in the team members
        if let unwrapChoice = choice, unwrapChoice < player.teamMembers.count {
            // chooseCharacter will be the team member unwrapped choice
            chooseCharacter = teamMembers[unwrapChoice]
            // we get the infos of the selected team member unwrap
            infosSelectCharacter(for: unwrapChoice)
            return chooseCharacter
        }
        // otherwise if unwrapChoice is not contained in the team member
        print("Choose a character in the list above.")
        // it will return to the func selectCharacter()
        return selectCharacter(player: player)
    }
    
    /// display the selected character and his quality
    private func infosSelectCharacter(for index: Int) {
        print("""
            You have selected \(teamMembers[index].characterName) the \(teamMembers[index].type) - \(teamMembers[index].lifePoints) ♡/\(teamMembers[index].maxLife) max ♡ - \(teamMembers[index].weapon.weaponName): ⚔️ \(teamMembers[index].weapon.damage)
            \(teamMembers[index].ability.abilityName) ability: ⚔️ \(teamMembers[index].ability.damage)/ 🛡 \(teamMembers[index].ability.damageReceived)!\n
            """)
    }
}
